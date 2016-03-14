package com.cn.utill;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

/*import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.ConsumerCancelledException;
import com.rabbitmq.client.QueueingConsumer;
import com.rabbitmq.client.ShutdownSignalException;

import cn.sh.yhk.controller.OperateController;*/

@Component
public class WindupApplication implements ApplicationListener<ContextRefreshedEvent> {

	private static Logger log = Logger.getLogger(WindupApplication.class);

	@Autowired
	private RequestMappingHandlerMapping handlerMapping;

	public void onApplicationEvent(ContextRefreshedEvent event) {
		this.searchUrl(event);
		//QueueReceived queue = new QueueReceived();
		//Thread t1 = new Thread(queue);
		//t1.start();
	}

	final private void searchUrl(ContextRefreshedEvent event) {
		if (event.getApplicationContext().getParent() == null) {
			Map map = this.handlerMapping.getHandlerMethods();
			Iterator<?> iterator = map.entrySet().iterator();
			while (iterator.hasNext()) {
				Map.Entry entry = (Map.Entry) iterator.next();
				String uri = entry.getKey().toString();
				String url = uri.substring(2, uri.indexOf(".do")) + ".do";
				log.info("ActionUrl" + url);
				System.out.println(url);
				//CommonConstant.MVCURL.add(url);
			}
		}
	}



/*class QueueReceived implements Runnable {
	private static final String TASK_QUEUE_NAME = "task_queue";

	public void run() {
		try {
			ConnectionFactory factory = new ConnectionFactory();
			factory.setHost("localhost");
			Connection connection = factory.newConnection();
			Channel channel = connection.createChannel();

			// 指定队列持久化
			channel.queueDeclare(TASK_QUEUE_NAME, true, false, false, null);
			System.out.println("消息队列已开启");
			// 指定该消费者同时只接收一条消息
			channel.basicQos(1);
			QueueingConsumer consumer = new QueueingConsumer(channel);
			// 打开消息应答机制
			channel.basicConsume(TASK_QUEUE_NAME, false, consumer);

			while (true) {
				QueueingConsumer.Delivery delivery = consumer.nextDelivery();
				String message = new String(delivery.getBody());
				System.out.println(" [x] Received '" + message + "'");
				System.out.println(" [x] Done");
				channel.basicAck(delivery.getEnvelope().getDeliveryTag(), false);
			}
		} catch (ShutdownSignalException e) {
			e.printStackTrace();
		} catch (ConsumerCancelledException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}*/
}
