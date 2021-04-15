package View;

import java.awt.Color;
import java.awt.EventQueue;

import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.concurrent.SynchronousQueue;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JRadioButton;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableModel;

import DAO.DeliveryDAO;
import DAO.MemberDAO;
import VO.DeliveryVO;
import VO.MemberVO;

import javax.swing.JComboBox;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.beans.Statement;
import java.lang.reflect.Member;
import java.security.Timestamp;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.swing.DefaultComboBoxModel;

public class Order_in {

	private JFrame frame;
	private JTextField dvrnum;
	private JTextField dvrcnt;
	private JTextField inname;
	
	DeliveryDAO daoo = new DeliveryDAO();
	ArrayList<DeliveryVO> al = daoo.allSelect();
	
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement pst = null;

	/**
	 * Create the application.
	 */
	public Order_in() {
		daoo.allSelect();
		initialize();
		frame.setVisible(true);
	}
	
	public void connect() {
		
		try {
			// 1. jdbc ����̹� �����ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String password = "hr";

			// 2. �����ͺ��̽� ���ᰴü(Connection) ����
			conn = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
			rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (conn != null) {
				conn.close();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void initialize() {
		frame = new JFrame();
		frame.getContentPane().setLayout(null);
		// ����� â ũ��
		int use_width = 291;
		int use_heigt = 439;
		// â ���� ���� ���� (��ġ���) > ��Ȯ�� �߾ӿ� ����
		int get_width = Toolkit.getDefaultToolkit().getScreenSize().width / 2;
		int get_heigt = Toolkit.getDefaultToolkit().getScreenSize().height / 2;
		// �߾ӿ� �߰� ��ġ ���
		int width = get_width - use_width / 2;
		int heigt = get_heigt - use_heigt / 2;
		// â ��ġ ����
		frame.setBounds(width, heigt, use_width, use_heigt);
		frame.setBackground(new Color(230, 230, 230));
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JLabel lblNewLabel = new JLabel("\uC7AC\uB8CC \uBC1C\uC8FC");
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setFont(new Font("����", Font.BOLD, 20));
		lblNewLabel.setBounds(67, 28, 142, 33);
		frame.getContentPane().add(lblNewLabel);
		
		
		
		ButtonGroup gender = new ButtonGroup();
		
		JButton btn_reset = new JButton("\uB418\uB3CC\uC544\uAC00\uAE30");
		
		btn_reset.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				
				frame.dispose();
				
				
			}
		});
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		String[] colname = {"�ֹ���ȣ", "����̸�", "��������", "���ּ���", "��������"};
		String[][] data = new String[al.size()][5];
		Timestamp[][] time = new Timestamp[al.size()][5];
		
		String[][] data1 = new String[al.size()][5];
//		Date[][] date = new Date[al.size()][5];
		for (int i = 0; i < al.size(); i++) {
			for (int j = 0; j < 5; j++) {
				if (j == 0) {
					data1[i][j] = al.get(i).getDvr_num();
				} 
				else if (j == 1) {
					data1[i][j] = al.get(i).getIn_name();
				}
				else if (j == 2) {
//					data1[i][j] = format1.format(al.get(i).getDvr_date());
				}
				else if (j == 3) {
					data1[i][j] = al.get(i).getDvr_cnt();
				}
				else if (j == 4) {
//					data1[i][j] = format1.format(al.get(i).getRcv_date());
				}
			}
		}
		
		
		
		btn_reset.setBounds(27, 348, 109, 23);
		frame.getContentPane().add(btn_reset);
		
		JButton btn_join = new JButton("\uCD94\uAC00");
		
		btn_join.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				
				frame.dispose();
				
				String num = dvrnum.getText();
				String name = inname.getText();	
				String cnt = dvrcnt.getText();
				
				if(name != "" && cnt != "") {
					
					MemberDAO dao = new MemberDAO();
					DeliveryDAO daoo = new DeliveryDAO();
					DeliveryVO vo = new DeliveryVO(num, name, null, cnt, null);
					
					boolean result = daoo.InsertDelivery(vo);
					
					
					if(result == true) {
						JOptionPane.showMessageDialog(null, "�ֹ� ����");
						
						new Main();
						
						frame.dispose();
						
						new Order_in();
						
						DefaultTableModel model = new DefaultTableModel(data1, colname);
						JTable table = new JTable(model);
						table.updateUI();
					
					}
					else {
						JOptionPane.showMessageDialog(null, "�ֹ�����", "�ֹ�", JOptionPane.ERROR_MESSAGE);
						
						new Main();
						frame.dispose();
						
						new Order_in();
				
					}
					
					
				}
				
				
			}
		});
		
		btn_join.setBounds(148, 348, 109, 23);
		frame.getContentPane().add(btn_join);
		
		ArrayList<MemberVO> a2 = new ArrayList<MemberVO>();
		
		//�߰�

		JLabel lblNewLabel_1 = new JLabel("\uC7AC\uB8CC \uBAA9\uB85D");
		lblNewLabel_1.setBounds(27, 175, 74, 25);
		frame.getContentPane().add(lblNewLabel_1);
		
		JLabel lblNewLabel_2 = new JLabel("\uC8FC\uBB38 \uC218\uB7C9");
		lblNewLabel_2.setBounds(27, 230, 74, 25);
		frame.getContentPane().add(lblNewLabel_2);
		
		dvrnum = new JTextField();
		dvrnum.setBounds(129, 124, 116, 21);
		frame.getContentPane().add(dvrnum);
		dvrnum.setColumns(10);
		
		inname = new JTextField();
		inname.setBounds(129, 177, 116, 21);
		frame.getContentPane().add(inname);
		inname.setColumns(10);
		
		//���� �Է�
		dvrcnt = new JTextField();
		dvrcnt.setBounds(128, 230, 117, 25);
		frame.getContentPane().add(dvrcnt);
		dvrcnt.setColumns(10);
		
		JLabel lblNewLabel_5 = new JLabel("New label");
		lblNewLabel_5.setBounds(27, 127, 57, 15);
		frame.getContentPane().add(lblNewLabel_5);
	}

}