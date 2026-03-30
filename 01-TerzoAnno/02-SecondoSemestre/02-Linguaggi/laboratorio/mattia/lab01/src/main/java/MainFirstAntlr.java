package antlr;

public class MainFirstAntlr {
    public static void main(String[] args) {
        CharStream cs = CharStream.fromString("1010");
        BinWordsLexer lexer = new BinWordsLexer(cs);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        BinWordsParser parser = new BinWordsParser(tokens);
        ParseTree tree = parser.main();
    }
}