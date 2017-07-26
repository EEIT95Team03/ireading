package org.iii.eeit9503.ireading.misc;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {
	private static final SessionFactory factory = buildSessionFactory();
    private static SessionFactory buildSessionFactory() {
        try {
            StandardServiceRegistry serviceRegistry =
                    new StandardServiceRegistryBuilder().configure().build();
            return new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    public static SessionFactory getSessionFactory() {
        return factory;
    }
    public static void closeSessionFactory() {
        if (factory != null) {
            factory.close();
        }
    }

}
