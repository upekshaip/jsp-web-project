package Config;

public class Functions {

    public void Functions() {
    }

    public String setGender(String gender) {
        String[] genders = {"Male", "Female", "Other"};

        String result = "";
        for (int i = 0; i < genders.length; i++) {
            if (gender.equals(genders[i])) {
                String text = "<option value='" + genders[i] + "' " + "selected" + ">" + genders[i] + "</option>";
                result += text;
            } else {
                String text = "<option value='" + genders[i] + "'" + ">" + genders[i] + "</option>";
                result += text;
            }
        }
        return result;
    }
}
