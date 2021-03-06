package edu.whu.mSpring;

import edu.whu.mSpring.servlet.DispatcherServlet;
import edu.whu.mTomcat.connector.HttpConnector;
import edu.whu.mTomcat.container.SimpleContainer;

public class ApplicationStartUp {
    public static void main(String[] args) {
        HttpConnector connector = new HttpConnector();
        SimpleContainer container = new SimpleContainer(new DispatcherServlet());
        connector.setContainer(container);
        try {
//            connector.initialize();
            Thread thread = connector.start();

            // make the application wait until we press any key.
            thread.join();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
