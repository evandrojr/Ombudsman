/*
 * Sistema de Ouvidoria: um canal através do qual os usuários
 * podem encaminhar suas reclamações, elogios e sugestões.
 * 
 * Copyright (C) 2011 SERPRO
 * 
 * Este programa é software livre; você pode redistribuí-lo e/ou
 * modificá-lo sob os termos da Licença Pública Geral GNU, conforme
 * publicada pela Free Software Foundation; tanto a versão 2 da
 * Licença como (a seu critério) qualquer versão mais nova.
 * 
 * Este programa é distribuído na expectativa de ser útil, mas SEM
 * QUALQUER GARANTIA; sem mesmo a garantia implícita de
 * COMERCIALIZAÇÃO ou de ADEQUAÇÃO A QUALQUER PROPÓSITO EM
 * PARTICULAR. Consulte a Licença Pública Geral GNU para obter mais
 * detalhes.
 * 
 * Você deve ter recebido uma cópia da Licença Pública Geral GNU,
 * sob o título "LICENCA.txt", junto com esse programa. Se não,
 * acesse o Portal do Software Público Brasileiro no endereço
 * http://www.softwarepublico.gov.br/ ou escreva para a Fundação do
 * Software Livre (FSF) Inc., 51 Franklin St, Fifth Floor, Boston,
 * MA 02111-1301, USA.
 * 
 * Contatos através do seguinte endereço internet:
 * http://www.serpro.gov.br/sistemaouvidoria/
 */
package com.lowagie.text;

import java.util.ArrayList;

/**
 * Interface for a text element.
 * <P>
 * Remark: I looked at the interface javax.swing.text.Element, but I decided to
 * write my own text-classes for two reasons:
 * <OL>
 * <LI>The javax.swing.text-classes may be very generic, I think they are
 * overkill: they are to heavy for what they have to do.
 * <LI>A lot of people using iText (formerly known as rugPdf), still use
 * JDK1.1.x. I try to keep the Java2 requirements limited to the Collection
 * classes (I think they're really great). However, if I use the
 * javax.swing.text classes, it will become very difficult to downgrade rugPdf.
 * </OL>
 * 
 * @see Anchor
 * @see Cell
 * @see Chapter
 * @see Chunk
 * @see Graphic
 * @see Header
 * @see Image
 * @see Jpeg
 * @see List
 * @see ListItem
 * @see Meta
 * @see Paragraph
 * @see Phrase
 * @see Rectangle
 * @see Row
 * @see Section
 * @see Table
 */

public interface Element {

	// static membervariables (meta information)

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int HEADER = 0;

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int TITLE = 1;

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int SUBJECT = 2;

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int KEYWORDS = 3;

	/** This is a possible type of <CODE>Element </CIDE>. */
	public static final int AUTHOR = 4;

	/** This is a possible type of <CODE>Element </CIDE>. */
	public static final int PRODUCER = 5;

	/** This is a possible type of <CODE>Element </CIDE>. */
	public static final int CREATIONDATE = 6;

	/** This is a possible type of <CODE>Element </CIDE>. */
	public static final int CREATOR = 7;

	// static membervariables (content)

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int CHUNK = 10;

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int PHRASE = 11;

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int PARAGRAPH = 12;

	/** This is a possible type of <CODE>Element</CODE> */
	public static final int SECTION = 13;

	/** This is a possible type of <CODE>Element</CODE> */
	public static final int LIST = 14;

	/** This is a possible type of <CODE>Element</CODE> */
	public static final int LISTITEM = 15;

	/** This is a possible type of <CODE>Element</CODE> */
	public static final int CHAPTER = 16;

	/** This is a possible type of <CODE>Element</CODE> */
	public static final int ANCHOR = 17;

	// static membervariables (tables)

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int CELL = 20;

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int ROW = 21;

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int TABLE = 22;

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int PTABLE = 23;

	// static membervariables (annotations)

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int ANNOTATION = 29;

	// static membervariables (geometric figures)

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int RECTANGLE = 30;

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int JPEG = 32;

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int IMGRAW = 34;

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int IMGTEMPLATE = 35;

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int GRAPHIC = 39;

	/** This is a possible type of <CODE>Element</CODE>. */
	public static final int MULTI_COLUMN_TEXT = 40;

	// static membervariables (alignment)

	/**
	 * A possible value for paragraph alignment. This specifies that the text is
	 * aligned to the left indent and extra whitespace should be placed on the
	 * right.
	 */
	public static final int ALIGN_UNDEFINED = -1;

	/**
	 * A possible value for paragraph alignment. This specifies that the text is
	 * aligned to the left indent and extra whitespace should be placed on the
	 * right.
	 */
	public static final int ALIGN_LEFT = 0;

	/**
	 * A possible value for paragraph alignment. This specifies that the text is
	 * aligned to the center and extra whitespace should be placed equally on
	 * the left and right.
	 */
	public static final int ALIGN_CENTER = 1;

	/**
	 * A possible value for paragraph alignment. This specifies that the text is
	 * aligned to the right indent and extra whitespace should be placed on the
	 * left.
	 */
	public static final int ALIGN_RIGHT = 2;

	/**
	 * A possible value for paragraph alignment. This specifies that extra
	 * whitespace should be spread out through the rows of the paragraph with
	 * the text lined up with the left and right indent except on the last line
	 * which should be aligned to the left.
	 */
	public static final int ALIGN_JUSTIFIED = 3;

	/**
	 * A possible value for vertical alignment.
	 */

	public static final int ALIGN_TOP = 4;

	/**
	 * A possible value for vertical alignment.
	 */

	public static final int ALIGN_MIDDLE = 5;

	/**
	 * A possible value for vertical alignment.
	 */

	public static final int ALIGN_BOTTOM = 6;

	/**
	 * A possible value for vertical alignment.
	 */
	public static final int ALIGN_BASELINE = 7;

	/**
	 * Does the same as ALIGN_JUSTIFIED but the last line is also spread out.
	 */
	public static final int ALIGN_JUSTIFIED_ALL = 8;

	// static member variables for CCITT compression

	/**
	 * Pure two-dimensional encoding (Group 4)
	 */
	public static final int CCITTG4 = 0x100;

	/**
	 * Pure one-dimensional encoding (Group 3, 1-D)
	 */
	public static final int CCITTG3_1D = 0x101;

	/**
	 * Mixed one- and two-dimensional encoding (Group 3, 2-D)
	 */
	public static final int CCITTG3_2D = 0x102;

	/**
	 * A flag indicating whether 1-bits are to be interpreted as black pixels
	 * and 0-bits as white pixels,
	 */
	public static final int CCITT_BLACKIS1 = 1;

	/**
	 * A flag indicating whether the filter expects extra 0-bits before each
	 * encoded line so that the line begins on a byte boundary.
	 */
	public static final int CCITT_ENCODEDBYTEALIGN = 2;

	/**
	 * A flag indicating whether end-of-line bit patterns are required to be
	 * present in the encoding.
	 */
	public static final int CCITT_ENDOFLINE = 4;

	/**
	 * A flag indicating whether the filter expects the encoded data to be
	 * terminated by an end-of-block pattern, overriding the Rows parameter. The
	 * use of this flag will set the key /EndOfBlock to false.
	 */
	public static final int CCITT_ENDOFBLOCK = 8;

	// methods

	/**
	 * Processes the element by adding it (or the different parts) to an <CODE>
	 * ElementListener</CODE>.
	 * 
	 * @param listener
	 *            an <CODE>ElementListener</CODE>
	 * @return <CODE>true</CODE> if the element was processed successfully
	 */

	public boolean process(ElementListener listener);

	/**
	 * Gets the type of the text element.
	 * 
	 * @return a type
	 */

	public int type();

	/**
	 * Gets all the chunks in this element.
	 * 
	 * @return an <CODE>ArrayList</CODE>
	 */

	public ArrayList getChunks();

	/**
	 * Gets the content of the text element.
	 * 
	 * @return a type
	 */

	public String toString();
}