.class Lorg/xmlrpc/android/XMLRPCSerializer;
.super Ljava/lang/Object;
.source "XMLRPCSerializer.java"

# interfaces
.implements Lorg/xmlrpc/android/IXMLRPCSerializer;


# static fields
.field static dateFormat:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 24
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd\'T\'HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/xmlrpc/android/XMLRPCSerializer;->dateFormat:Ljava/text/SimpleDateFormat;

    .line 23
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;
    .locals 20
    .parameter "parser"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    const/16 v17, 0x2

    const/16 v18, 0x0

    const-string v19, "value"

    move-object/from16 v0, p1

    move/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-interface {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 106
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->isEmptyElementTag()Z

    move-result v17

    if-eqz v17, :cond_0

    .line 108
    const-string v12, ""

    .line 212
    :goto_0
    return-object v12

    .line 112
    :cond_0
    const/4 v5, 0x1

    .line 113
    .local v5, hasType:Z
    const/4 v15, 0x0

    .line 115
    .local v15, typeNodeName:Ljava/lang/String;
    :try_start_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 116
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    .line 117
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v17

    const/16 v18, 0x3

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_1

    .line 119
    const-string v12, ""

    goto :goto_0

    .line 121
    :catch_0
    move-exception v4

    .line 122
    .local v4, e:Lorg/xmlpull/v1/XmlPullParserException;
    const/4 v5, 0x0

    .line 124
    .end local v4           #e:Lorg/xmlpull/v1/XmlPullParserException;
    :cond_1
    if-eqz v5, :cond_13

    .line 125
    const-string v17, "int"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_2

    const-string v17, "i4"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_3

    .line 126
    :cond_2
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v16

    .line 127
    .local v16, value:Ljava/lang/String;
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    .line 210
    .end local v16           #value:Ljava/lang/String;
    :goto_1
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 211
    const/16 v17, 0x3

    const/16 v18, 0x0

    const-string v19, "value"

    move-object/from16 v0, p1

    move/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-interface {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 129
    :cond_3
    const-string v17, "i8"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 130
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v16

    .line 131
    .restart local v16       #value:Ljava/lang/String;
    invoke-static/range {v16 .. v16}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v17

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    .local v12, obj:Ljava/lang/Long;
    goto :goto_1

    .line 133
    .end local v12           #obj:Ljava/lang/Long;
    .end local v16           #value:Ljava/lang/String;
    :cond_4
    const-string v17, "double"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_5

    .line 134
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v16

    .line 135
    .restart local v16       #value:Ljava/lang/String;
    invoke-static/range {v16 .. v16}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v17

    invoke-static/range {v17 .. v18}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v12

    .local v12, obj:Ljava/lang/Double;
    goto :goto_1

    .line 137
    .end local v12           #obj:Ljava/lang/Double;
    .end local v16           #value:Ljava/lang/String;
    :cond_5
    const-string v17, "boolean"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_7

    .line 138
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v16

    .line 139
    .restart local v16       #value:Ljava/lang/String;
    const-string v17, "1"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_6

    sget-object v12, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .local v12, obj:Ljava/lang/Boolean;
    :goto_2
    goto :goto_1

    .end local v12           #obj:Ljava/lang/Boolean;
    :cond_6
    sget-object v12, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_2

    .line 141
    .end local v16           #value:Ljava/lang/String;
    :cond_7
    const-string v17, "string"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_8

    .line 142
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v12

    .local v12, obj:Ljava/lang/String;
    goto :goto_1

    .line 144
    .end local v12           #obj:Ljava/lang/String;
    :cond_8
    const-string v17, "dateTime.iso8601"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_9

    .line 145
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v16

    .line 147
    .restart local v16       #value:Ljava/lang/String;
    :try_start_1
    sget-object v17, Lorg/xmlrpc/android/XMLRPCSerializer;->dateFormat:Ljava/text/SimpleDateFormat;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->parseObject(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v12

    .local v12, obj:Ljava/lang/Object;
    goto/16 :goto_1

    .line 148
    .end local v12           #obj:Ljava/lang/Object;
    :catch_1
    move-exception v4

    .line 149
    .local v4, e:Ljava/text/ParseException;
    new-instance v17, Ljava/io/IOException;

    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "Cannot deserialize dateTime "

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 152
    .end local v4           #e:Ljava/text/ParseException;
    .end local v16           #value:Ljava/lang/String;
    :cond_9
    const-string v17, "base64"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_b

    .line 153
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v16

    .line 154
    .restart local v16       #value:Ljava/lang/String;
    new-instance v13, Ljava/io/BufferedReader;

    new-instance v17, Ljava/io/StringReader;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-direct {v13, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 156
    .local v13, reader:Ljava/io/BufferedReader;
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    .line 157
    .local v14, sb:Ljava/lang/StringBuffer;
    :goto_3
    invoke-virtual {v13}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .local v6, line:Ljava/lang/String;
    if-nez v6, :cond_a

    .line 160
    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/xmlrpc/android/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object v12

    .local v12, obj:[B
    goto/16 :goto_1

    .line 158
    .end local v12           #obj:[B
    :cond_a
    invoke-virtual {v14, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_3

    .line 162
    .end local v6           #line:Ljava/lang/String;
    .end local v13           #reader:Ljava/io/BufferedReader;
    .end local v14           #sb:Ljava/lang/StringBuffer;
    .end local v16           #value:Ljava/lang/String;
    :cond_b
    const-string v17, "array"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_d

    .line 163
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 164
    const/16 v17, 0x2

    const/16 v18, 0x0

    const-string v19, "data"

    move-object/from16 v0, p1

    move/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-interface {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 166
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 167
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 168
    .local v7, list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Object;>;"
    :goto_4
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v17

    const-string v18, "value"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_c

    .line 172
    const/16 v17, 0x3

    const/16 v18, 0x0

    const-string v19, "data"

    move-object/from16 v0, p1

    move/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-interface {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 173
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 174
    const/16 v17, 0x3

    const/16 v18, 0x0

    const-string v19, "array"

    move-object/from16 v0, p1

    move/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-interface {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 175
    invoke-interface {v7}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v12

    .local v12, obj:[Ljava/lang/Object;
    goto/16 :goto_1

    .line 169
    .end local v12           #obj:[Ljava/lang/Object;
    :cond_c
    invoke-virtual/range {p0 .. p1}, Lorg/xmlrpc/android/XMLRPCSerializer;->deserialize(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto :goto_4

    .line 177
    .end local v7           #list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Object;>;"
    :cond_d
    const-string v17, "struct"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_12

    .line 178
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 179
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 180
    .local v8, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_5
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v17

    const-string v18, "member"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_e

    .line 201
    const/16 v17, 0x3

    const/16 v18, 0x0

    const-string v19, "struct"

    move-object/from16 v0, p1

    move/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-interface {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 202
    move-object v12, v8

    .local v12, obj:Ljava/util/Map;
    goto/16 :goto_1

    .line 181
    .end local v12           #obj:Ljava/util/Map;
    :cond_e
    const/4 v9, 0x0

    .line 182
    .local v9, memberName:Ljava/lang/String;
    const/4 v10, 0x0

    .line 184
    :goto_6
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 185
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    .line 186
    .local v11, name:Ljava/lang/String;
    const-string v17, "name"

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_f

    .line 187
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v9

    goto :goto_6

    .line 189
    :cond_f
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_10

    .line 190
    invoke-virtual/range {p0 .. p1}, Lorg/xmlrpc/android/XMLRPCSerializer;->deserialize(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;

    move-result-object v10

    .line 183
    .local v10, memberValue:Ljava/lang/Object;
    goto :goto_6

    .line 195
    .end local v10           #memberValue:Ljava/lang/Object;
    :cond_10
    if-eqz v9, :cond_11

    if-eqz v10, :cond_11

    .line 196
    invoke-interface {v8, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    :cond_11
    const/16 v17, 0x3

    const/16 v18, 0x0

    const-string v19, "member"

    move-object/from16 v0, p1

    move/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-interface {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 199
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto :goto_5

    .line 204
    .end local v8           #map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v9           #memberName:Ljava/lang/String;
    .end local v11           #name:Ljava/lang/String;
    :cond_12
    new-instance v17, Ljava/io/IOException;

    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "Cannot deserialize "

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 208
    :cond_13
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v12

    .local v12, obj:Ljava/lang/String;
    goto/16 :goto_1
.end method

.method public serialize(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;)V
    .locals 20
    .parameter "serializer"
    .parameter "object"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/lang/Integer;

    move/from16 v17, v0

    if-nez v17, :cond_0

    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/lang/Short;

    move/from16 v17, v0

    if-nez v17, :cond_0

    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/lang/Byte;

    move/from16 v17, v0

    if-eqz v17, :cond_1

    .line 30
    :cond_0
    const/16 v17, 0x0

    const-string v18, "i4"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    const/16 v18, 0x0

    const-string v19, "i4"

    invoke-interface/range {v17 .. v19}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 101
    .end local p2
    :goto_0
    return-void

    .line 32
    .restart local p2
    :cond_1
    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/lang/Long;

    move/from16 v17, v0

    if-eqz v17, :cond_2

    .line 33
    const/16 v17, 0x0

    const-string v18, "i8"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    const/16 v18, 0x0

    const-string v19, "i8"

    invoke-interface/range {v17 .. v19}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_0

    .line 35
    :cond_2
    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/lang/Double;

    move/from16 v17, v0

    if-nez v17, :cond_3

    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/lang/Float;

    move/from16 v17, v0

    if-eqz v17, :cond_4

    .line 36
    :cond_3
    const/16 v17, 0x0

    const-string v18, "double"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    const/16 v18, 0x0

    const-string v19, "double"

    invoke-interface/range {v17 .. v19}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_0

    .line 38
    :cond_4
    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/lang/Boolean;

    move/from16 v17, v0

    if-eqz v17, :cond_6

    move-object/from16 v3, p2

    .line 39
    check-cast v3, Ljava/lang/Boolean;

    .line 40
    .local v3, bool:Ljava/lang/Boolean;
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v17

    if-eqz v17, :cond_5

    const-string v4, "1"

    .line 41
    .local v4, boolStr:Ljava/lang/String;
    :goto_1
    const/16 v17, 0x0

    const-string v18, "boolean"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v0, v4}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    const/16 v18, 0x0

    const-string v19, "boolean"

    invoke-interface/range {v17 .. v19}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto/16 :goto_0

    .line 40
    .end local v4           #boolStr:Ljava/lang/String;
    :cond_5
    const-string v4, "0"

    goto :goto_1

    .line 43
    .end local v3           #bool:Ljava/lang/Boolean;
    :cond_6
    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/lang/String;

    move/from16 v17, v0

    if-eqz v17, :cond_7

    .line 44
    const/16 v17, 0x0

    const-string v18, "string"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    const/16 v18, 0x0

    const-string v19, "string"

    invoke-interface/range {v17 .. v19}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto/16 :goto_0

    .line 46
    :cond_7
    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/util/Date;

    move/from16 v17, v0

    if-nez v17, :cond_8

    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/util/Calendar;

    move/from16 v17, v0

    if-eqz v17, :cond_9

    .line 47
    :cond_8
    sget-object v17, Lorg/xmlrpc/android/XMLRPCSerializer;->dateFormat:Ljava/text/SimpleDateFormat;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 48
    .local v5, dateStr:Ljava/lang/String;
    const/16 v17, 0x0

    const-string v18, "dateTime.iso8601"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v0, v5}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    const/16 v18, 0x0

    const-string v19, "dateTime.iso8601"

    invoke-interface/range {v17 .. v19}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto/16 :goto_0

    .line 50
    .end local v5           #dateStr:Ljava/lang/String;
    :cond_9
    move-object/from16 v0, p2

    instance-of v0, v0, [B

    move/from16 v17, v0

    if-eqz v17, :cond_a

    .line 51
    new-instance v16, Ljava/lang/String;

    check-cast p2, [B

    .end local p2
    invoke-static/range {p2 .. p2}, Lorg/xmlrpc/android/Base64Coder;->encode([B)[C

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/String;-><init>([C)V

    .line 52
    .local v16, value:Ljava/lang/String;
    const/16 v17, 0x0

    const-string v18, "base64"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    const/16 v18, 0x0

    const-string v19, "base64"

    invoke-interface/range {v17 .. v19}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto/16 :goto_0

    .line 54
    .end local v16           #value:Ljava/lang/String;
    .restart local p2
    :cond_a
    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/util/List;

    move/from16 v17, v0

    if-eqz v17, :cond_c

    .line 55
    const/16 v17, 0x0

    const-string v18, "array"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    const/16 v18, 0x0

    const-string v19, "data"

    invoke-interface/range {v17 .. v19}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-object/from16 v11, p2

    .line 56
    check-cast v11, Ljava/util/List;

    .line 57
    .local v11, list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .line 58
    .local v8, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/Object;>;"
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-nez v17, :cond_b

    .line 64
    const/16 v17, 0x0

    const-string v18, "data"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    const/16 v18, 0x0

    const-string v19, "array"

    invoke-interface/range {v17 .. v19}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto/16 :goto_0

    .line 59
    :cond_b
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .line 60
    .local v13, o:Ljava/lang/Object;
    const/16 v17, 0x0

    const-string v18, "value"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 61
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v13}, Lorg/xmlrpc/android/XMLRPCSerializer;->serialize(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;)V

    .line 62
    const/16 v17, 0x0

    const-string v18, "value"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_2

    .line 66
    .end local v8           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/Object;>;"
    .end local v11           #list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Object;>;"
    .end local v13           #o:Ljava/lang/Object;
    :cond_c
    move-object/from16 v0, p2

    instance-of v0, v0, [Ljava/lang/Object;

    move/from16 v17, v0

    if-eqz v17, :cond_e

    .line 67
    const/16 v17, 0x0

    const-string v18, "array"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    const/16 v18, 0x0

    const-string v19, "data"

    invoke-interface/range {v17 .. v19}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-object/from16 v14, p2

    .line 68
    check-cast v14, [Ljava/lang/Object;

    .line 69
    .local v14, objects:[Ljava/lang/Object;
    const/4 v7, 0x0

    .local v7, i:I
    :goto_3
    array-length v0, v14

    move/from16 v17, v0

    move/from16 v0, v17

    if-lt v7, v0, :cond_d

    .line 75
    const/16 v17, 0x0

    const-string v18, "data"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    const/16 v18, 0x0

    const-string v19, "array"

    invoke-interface/range {v17 .. v19}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto/16 :goto_0

    .line 70
    :cond_d
    aget-object v13, v14, v7

    .line 71
    .restart local v13       #o:Ljava/lang/Object;
    const/16 v17, 0x0

    const-string v18, "value"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 72
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v13}, Lorg/xmlrpc/android/XMLRPCSerializer;->serialize(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;)V

    .line 73
    const/16 v17, 0x0

    const-string v18, "value"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 69
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 77
    .end local v7           #i:I
    .end local v13           #o:Ljava/lang/Object;
    .end local v14           #objects:[Ljava/lang/Object;
    :cond_e
    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/util/Map;

    move/from16 v17, v0

    if-eqz v17, :cond_10

    .line 78
    const/16 v17, 0x0

    const-string v18, "struct"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-object/from16 v12, p2

    .line 79
    check-cast v12, Ljava/util/Map;

    .line 80
    .local v12, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v12}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 81
    .local v9, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-nez v17, :cond_f

    .line 93
    const/16 v17, 0x0

    const-string v18, "struct"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto/16 :goto_0

    .line 82
    :cond_f
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 83
    .local v6, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 84
    .local v10, key:Ljava/lang/String;
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v16

    .line 86
    .local v16, value:Ljava/lang/Object;
    const/16 v17, 0x0

    const-string v18, "member"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 87
    const/16 v17, 0x0

    const-string v18, "name"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v0, v10}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v17

    const/16 v18, 0x0

    const-string v19, "name"

    invoke-interface/range {v17 .. v19}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 88
    const/16 v17, 0x0

    const-string v18, "value"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 89
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lorg/xmlrpc/android/XMLRPCSerializer;->serialize(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;)V

    .line 90
    const/16 v17, 0x0

    const-string v18, "value"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 91
    const/16 v17, 0x0

    const-string v18, "member"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_4

    .line 95
    .end local v6           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v9           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v10           #key:Ljava/lang/String;
    .end local v12           #map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v16           #value:Ljava/lang/Object;
    :cond_10
    move-object/from16 v0, p2

    instance-of v0, v0, Lorg/xmlrpc/android/XMLRPCSerializable;

    move/from16 v17, v0

    if-eqz v17, :cond_11

    move-object/from16 v15, p2

    .line 96
    check-cast v15, Lorg/xmlrpc/android/XMLRPCSerializable;

    .line 97
    .local v15, serializable:Lorg/xmlrpc/android/XMLRPCSerializable;
    invoke-interface {v15}, Lorg/xmlrpc/android/XMLRPCSerializable;->getSerializable()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/xmlrpc/android/XMLRPCSerializer;->serialize(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 99
    .end local v15           #serializable:Lorg/xmlrpc/android/XMLRPCSerializable;
    :cond_11
    new-instance v17, Ljava/io/IOException;

    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "Cannot serialize "

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v17
.end method
