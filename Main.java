public class Main {
    public static void main(String[] args) {
        QuestionDAO questionDAO = new QuestionDAO();

        // Fetch and display all questions
        System.out.println("Questions:");
        for (Question question : questionDAO.getAllQuestions()) {
            System.out.println("ID: " + question.getQuestionId());
            System.out.println("Hindi: " + question.getContentHindi());
            System.out.println("English: " + question.getContentEnglish());
            System.out.println("Category: " + question.getCategory());
            System.out.println("---------");
        }

        // Fetch and display answer for a specific question ID
        int questionId = 1; // Change this to the ID you want to test
        System.out.println("Answer for question ID " + questionId + ":");
        System.out.println(questionDAO.getAnswerByQuestionId(questionId));
    }
}
