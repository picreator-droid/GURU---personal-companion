import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {
    // Retrieve all questions
    public List<Question> getAllQuestions() {
        List<Question> questions = new ArrayList<>();
        String query = "SELECT * FROM Questions";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Question question = new Question();
                question.setQuestionId(rs.getInt("question_id"));
                question.setContentHindi(rs.getString("content_hindi"));
                question.setContentEnglish(rs.getString("content_english"));
                question.setCategory(rs.getString("category"));
                questions.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }

    // Get answer by question ID
    public String getAnswerByQuestionId(int questionId) {
        String query = "SELECT content FROM Answers WHERE question_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, questionId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("content");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Answer not found.";
    }
}
