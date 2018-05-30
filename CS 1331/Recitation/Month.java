public enum Month{//useful in sorting and allows only one instance of
    January(31);
    Febuary(28);
    March(31);
    April(30);
    May(31);
    June(30);
    July(31);
    August(31);
    September(30);
    October(31);
    November(30);
    December(31);

    private final int days;

    public Month(int days){
        this.days = days;
    }

    public int getDays(){
        return days;
    }

}