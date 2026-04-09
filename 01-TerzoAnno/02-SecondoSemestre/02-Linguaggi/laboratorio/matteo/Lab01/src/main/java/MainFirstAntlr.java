import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.IOException;

public class MainFirstAntlr {

    public static void main(String[] args) throws IOException {
        CharStream cs = CharStreams.fromFileName("input.txt");
        BinWordsLexer lexer = new BinWordsLexer(cs);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        BinWordsParser parser = new BinWordsParser(tokens);
        ParseTree tree = parser.main();
    }

}
