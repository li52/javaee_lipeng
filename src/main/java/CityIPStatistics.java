import com.mysql.jdbc.Driver;

import java.sql.*;
import java.util.LinkedHashMap;
import java.util.Map;
/**
 * Created by ${李朋}
 * on 2017/6/10.
 */
public class CityIPStatistics {
    private static final String URL = "jdbc:mysql:///?user=root&password=";
    private static final String SQL_CITY = "SELECT id,city FROM czip.ip_city";
    private static final String SQL_COUNT = "SELECT COUNT(*) FROM czip.ip WHERE geo REGEXP ?";
    private static final String SQL_UPDATE = "UPDATE czip.ip_city SET count = ? WHERE id = ?";
    private static final String SQL_QUERY = "SELECT * FROM czip.ip_city ORDER BY count DESC";

    private static Map<Integer, String> cities = new LinkedHashMap<>();
    public static void main(String[] args) throws SQLException {
        new Driver();
        Connection connection = DriverManager.getConnection(URL);
//        查询城市的 ID，名字，存入 LinkedHashMap 容器内
        PreparedStatement ps = connection.prepareStatement(SQL_CITY);
        ResultSet resultSet = ps.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String city = resultSet.getString("city");
            cities.put(id, city);
            System.out.println(cities.toString());
        }
        resultSet.close();

        connection.setAutoCommit(false);
        PreparedStatement statement = null;
//      从 IP 表内，正则匹配查询 城市的数量，并更新到 ip_city 表格的 count 列中
        for (Map.Entry<Integer, String> entry : cities.entrySet()) {
            ps = connection.prepareStatement(SQL_COUNT);
            ps.setString(1, entry.getValue());
            resultSet = ps.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);
            int id = entry.getKey();
            statement = connection.prepareStatement(SQL_UPDATE);
            statement.setInt(1, count);
            statement.setInt(2, id);
//            添加批处理
            ps.addBatch();
        }
        if (statement != null) {
//            执行批处理
            statement.executeBatch();
            resultSet.next();
            connection.commit();
            statement.close();
        }
//        查询 ip_city 表中 count 数量，生成 Jason 数据
        /*ps = connection.prepareStatement(SQL_QUERY);
        resultSet = ps.executeQuery();
        while (resultSet.next()) {
            try (
                    BufferedWriter bw = new BufferedWriter(new FileWriter("/Users/bonismo/Desktop/jason.txt", true))
            ) {
                String city = resultSet.getString("city");
                String lon = resultSet.getString("lon");
                String lat = resultSet.getString("lat");
                int count = resultSet.getInt("count");
                String data = "{name: '" + city + "',value:[" + lon + "," + lat + "," + count + "]},";
                System.out.println(data);
                bw.write(data + "\n");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }*/
    }
}
