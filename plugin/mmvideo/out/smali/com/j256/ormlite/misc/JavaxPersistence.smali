.class public Lcom/j256/ormlite/misc/JavaxPersistence;
.super Ljava/lang/Object;
.source "JavaxPersistence.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFieldConfig(Lcom/j256/ormlite/db/DatabaseType;Ljava/lang/reflect/Field;)Lcom/j256/ormlite/field/DatabaseFieldConfig;
    .locals 28
    .parameter "databaseType"
    .parameter "field"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 28
    const/4 v5, 0x0

    .line 29
    .local v5, columnAnnotation:Ljava/lang/annotation/Annotation;
    const/4 v14, 0x0

    .line 30
    .local v14, idAnnotation:Ljava/lang/annotation/Annotation;
    const/4 v12, 0x0

    .line 31
    .local v12, generatedValueAnnotation:Ljava/lang/annotation/Annotation;
    const/16 v21, 0x0

    .line 32
    .local v21, oneToOneAnnotation:Ljava/lang/annotation/Annotation;
    const/16 v17, 0x0

    .line 33
    .local v17, manyToOneAnnotation:Ljava/lang/annotation/Annotation;
    const/4 v15, 0x0

    .line 34
    .local v15, joinColumnAnnotation:Ljava/lang/annotation/Annotation;
    const/4 v9, 0x0

    .line 35
    .local v9, enumeratedAnnotation:Ljava/lang/annotation/Annotation;
    const/16 v24, 0x0

    .line 37
    .local v24, versionAnnotation:Ljava/lang/annotation/Annotation;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/reflect/Field;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v4

    .local v4, arr$:[Ljava/lang/annotation/Annotation;
    array-length v0, v4

    move/from16 v16, v0

    .local v16, len$:I
    const/4 v13, 0x0

    .local v13, i$:I
    :goto_0
    move/from16 v0, v16

    if-ge v13, v0, :cond_8

    aget-object v2, v4, v13

    .line 38
    .local v2, annotation:Ljava/lang/annotation/Annotation;
    invoke-interface {v2}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v3

    .line 39
    .local v3, annotationClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v25

    const-string v26, "javax.persistence.Column"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_0

    .line 40
    move-object v5, v2

    .line 42
    :cond_0
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v25

    const-string v26, "javax.persistence.Id"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_1

    .line 43
    move-object v14, v2

    .line 45
    :cond_1
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v25

    const-string v26, "javax.persistence.GeneratedValue"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_2

    .line 46
    move-object v12, v2

    .line 48
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v25

    const-string v26, "javax.persistence.OneToOne"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_3

    .line 49
    move-object/from16 v21, v2

    .line 51
    :cond_3
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v25

    const-string v26, "javax.persistence.ManyToOne"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_4

    .line 52
    move-object/from16 v17, v2

    .line 54
    :cond_4
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v25

    const-string v26, "javax.persistence.JoinColumn"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_5

    .line 55
    move-object v15, v2

    .line 57
    :cond_5
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v25

    const-string v26, "javax.persistence.Enumerated"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_6

    .line 58
    move-object v9, v2

    .line 60
    :cond_6
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v25

    const-string v26, "javax.persistence.Version"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_7

    .line 61
    move-object/from16 v24, v2

    .line 37
    :cond_7
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 65
    .end local v2           #annotation:Ljava/lang/annotation/Annotation;
    .end local v3           #annotationClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_8
    if-nez v5, :cond_9

    if-nez v14, :cond_9

    if-nez v21, :cond_9

    if-nez v17, :cond_9

    if-nez v9, :cond_9

    if-nez v24, :cond_9

    .line 67
    const/4 v7, 0x0

    .line 186
    :goto_1
    return-object v7

    .line 70
    :cond_9
    new-instance v7, Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-direct {v7}, Lcom/j256/ormlite/field/DatabaseFieldConfig;-><init>()V

    .line 71
    .local v7, config:Lcom/j256/ormlite/field/DatabaseFieldConfig;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v11

    .line 72
    .local v11, fieldName:Ljava/lang/String;
    invoke-interface/range {p0 .. p0}, Lcom/j256/ormlite/db/DatabaseType;->isEntityNamesMustBeUpCase()Z

    move-result v25

    if-eqz v25, :cond_a

    .line 73
    invoke-virtual {v11}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v11

    .line 75
    :cond_a
    invoke-virtual {v7, v11}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setFieldName(Ljava/lang/String;)V

    .line 77
    if-eqz v5, :cond_e

    .line 79
    :try_start_0
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v25

    const-string v26, "name"

    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v27, v0

    invoke-virtual/range {v25 .. v27}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v18

    .line 80
    .local v18, method:Ljava/lang/reflect/Method;
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-virtual {v0, v5, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 81
    .local v19, name:Ljava/lang/String;
    if-eqz v19, :cond_b

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v25

    if-lez v25, :cond_b

    .line 82
    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setColumnName(Ljava/lang/String;)V

    .line 84
    :cond_b
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v25

    const-string v26, "columnDefinition"

    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v27, v0

    invoke-virtual/range {v25 .. v27}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v18

    .line 85
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-virtual {v0, v5, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 86
    .local v6, columnDefinition:Ljava/lang/String;
    if-eqz v6, :cond_c

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v25

    if-lez v25, :cond_c

    .line 87
    invoke-virtual {v7, v6}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setColumnDefinition(Ljava/lang/String;)V

    .line 89
    :cond_c
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v25

    const-string v26, "length"

    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v27, v0

    invoke-virtual/range {v25 .. v27}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v18

    .line 90
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-virtual {v0, v5, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/Integer;

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    move/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setWidth(I)V

    .line 91
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v25

    const-string v26, "nullable"

    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v27, v0

    invoke-virtual/range {v25 .. v27}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v18

    .line 92
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-virtual {v0, v5, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Boolean;

    .line 93
    .local v20, nullable:Ljava/lang/Boolean;
    if-eqz v20, :cond_d

    .line 94
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v25

    move/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setCanBeNull(Z)V

    .line 96
    :cond_d
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v25

    const-string v26, "unique"

    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v27, v0

    invoke-virtual/range {v25 .. v27}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v18

    .line 97
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-virtual {v0, v5, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/lang/Boolean;

    .line 98
    .local v23, unique:Ljava/lang/Boolean;
    if-eqz v23, :cond_e

    .line 99
    invoke-virtual/range {v23 .. v23}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v25

    move/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setUnique(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .end local v6           #columnDefinition:Ljava/lang/String;
    .end local v18           #method:Ljava/lang/reflect/Method;
    .end local v19           #name:Ljava/lang/String;
    .end local v20           #nullable:Ljava/lang/Boolean;
    .end local v23           #unique:Ljava/lang/Boolean;
    :cond_e
    if-eqz v14, :cond_f

    .line 107
    if-nez v12, :cond_17

    .line 108
    const/16 v25, 0x1

    move/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setId(Z)V

    .line 114
    :cond_f
    :goto_2
    if-nez v21, :cond_10

    if-eqz v17, :cond_13

    .line 116
    :cond_10
    const-class v25, Ljava/util/Collection;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v25

    if-nez v25, :cond_11

    const-class v25, Lcom/j256/ormlite/dao/ForeignCollection;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v25

    if-eqz v25, :cond_18

    .line 118
    :cond_11
    const/16 v25, 0x1

    move/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollection(Z)V

    .line 119
    if-eqz v15, :cond_13

    .line 121
    :try_start_1
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v25

    const-string v26, "name"

    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v27, v0

    invoke-virtual/range {v25 .. v27}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v18

    .line 122
    .restart local v18       #method:Ljava/lang/reflect/Method;
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-virtual {v0, v15, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 123
    .restart local v19       #name:Ljava/lang/String;
    if-eqz v19, :cond_12

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v25

    if-lez v25, :cond_12

    .line 124
    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollectionColumnName(Ljava/lang/String;)V

    .line 126
    :cond_12
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v25

    const-string v26, "fetch"

    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v27, v0

    invoke-virtual/range {v25 .. v27}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v18

    .line 127
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-virtual {v0, v15, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 128
    .local v10, fetchType:Ljava/lang/Object;
    if-eqz v10, :cond_13

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v25

    const-string v26, "EAGER"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_13

    .line 129
    const/16 v25, 0x1

    move/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollectionEager(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 163
    .end local v10           #fetchType:Ljava/lang/Object;
    .end local v18           #method:Ljava/lang/reflect/Method;
    .end local v19           #name:Ljava/lang/String;
    :cond_13
    :goto_3
    if-eqz v9, :cond_14

    .line 165
    :try_start_2
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v25

    const-string v26, "value"

    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v27, v0

    invoke-virtual/range {v25 .. v27}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v18

    .line 166
    .restart local v18       #method:Ljava/lang/reflect/Method;
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-virtual {v0, v9, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    .line 167
    .local v22, typeValue:Ljava/lang/Object;
    if-eqz v22, :cond_1b

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v25

    const-string v26, "STRING"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_1b

    .line 168
    sget-object v25, Lcom/j256/ormlite/field/DataType;->ENUM_STRING:Lcom/j256/ormlite/field/DataType;

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setDataType(Lcom/j256/ormlite/field/DataType;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 177
    .end local v18           #method:Ljava/lang/reflect/Method;
    .end local v22           #typeValue:Ljava/lang/Object;
    :cond_14
    :goto_4
    if-eqz v24, :cond_15

    .line 179
    const/16 v25, 0x1

    move/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setVersion(Z)V

    .line 181
    :cond_15
    invoke-virtual {v7}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getDataPersister()Lcom/j256/ormlite/field/DataPersister;

    move-result-object v25

    if-nez v25, :cond_16

    .line 182
    invoke-static/range {p1 .. p1}, Lcom/j256/ormlite/field/DataPersisterManager;->lookupForField(Ljava/lang/reflect/Field;)Lcom/j256/ormlite/field/DataPersister;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setDataPersister(Lcom/j256/ormlite/field/DataPersister;)V

    .line 184
    :cond_16
    const/16 v25, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-static {v0, v1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->findGetMethod(Ljava/lang/reflect/Field;Z)Ljava/lang/reflect/Method;

    move-result-object v25

    if-eqz v25, :cond_1c

    const/16 v25, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-static {v0, v1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->findSetMethod(Ljava/lang/reflect/Field;Z)Ljava/lang/reflect/Method;

    move-result-object v25

    if-eqz v25, :cond_1c

    const/16 v25, 0x1

    :goto_5
    move/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setUseGetSet(Z)V

    goto/16 :goto_1

    .line 101
    :catch_0
    move-exception v8

    .line 102
    .local v8, e:Ljava/lang/Exception;
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Problem accessing fields from the @Column annotation for field "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-static {v0, v8}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v25

    throw v25

    .line 111
    .end local v8           #e:Ljava/lang/Exception;
    :cond_17
    const/16 v25, 0x1

    move/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setGeneratedId(Z)V

    goto/16 :goto_2

    .line 131
    :catch_1
    move-exception v8

    .line 132
    .restart local v8       #e:Ljava/lang/Exception;
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Problem accessing fields from the @JoinColumn annotation for field "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-static {v0, v8}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v25

    throw v25

    .line 138
    .end local v8           #e:Ljava/lang/Exception;
    :cond_18
    const/16 v25, 0x1

    move/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeign(Z)V

    .line 139
    if-eqz v15, :cond_13

    .line 141
    :try_start_3
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v25

    const-string v26, "name"

    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v27, v0

    invoke-virtual/range {v25 .. v27}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v18

    .line 142
    .restart local v18       #method:Ljava/lang/reflect/Method;
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-virtual {v0, v15, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 143
    .restart local v19       #name:Ljava/lang/String;
    if-eqz v19, :cond_19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v25

    if-lez v25, :cond_19

    .line 144
    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setColumnName(Ljava/lang/String;)V

    .line 146
    :cond_19
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v25

    const-string v26, "nullable"

    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v27, v0

    invoke-virtual/range {v25 .. v27}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v18

    .line 147
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-virtual {v0, v15, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Boolean;

    .line 148
    .restart local v20       #nullable:Ljava/lang/Boolean;
    if-eqz v20, :cond_1a

    .line 149
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v25

    move/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setCanBeNull(Z)V

    .line 151
    :cond_1a
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v25

    const-string v26, "unique"

    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v27, v0

    invoke-virtual/range {v25 .. v27}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v18

    .line 152
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-virtual {v0, v15, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/lang/Boolean;

    .line 153
    .restart local v23       #unique:Ljava/lang/Boolean;
    if-eqz v23, :cond_13

    .line 154
    invoke-virtual/range {v23 .. v23}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v25

    move/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setUnique(Z)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_3

    .line 156
    .end local v18           #method:Ljava/lang/reflect/Method;
    .end local v19           #name:Ljava/lang/String;
    .end local v20           #nullable:Ljava/lang/Boolean;
    .end local v23           #unique:Ljava/lang/Boolean;
    :catch_2
    move-exception v8

    .line 157
    .restart local v8       #e:Ljava/lang/Exception;
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Problem accessing fields from the @JoinColumn annotation for field "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-static {v0, v8}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v25

    throw v25

    .line 170
    .end local v8           #e:Ljava/lang/Exception;
    .restart local v18       #method:Ljava/lang/reflect/Method;
    .restart local v22       #typeValue:Ljava/lang/Object;
    :cond_1b
    :try_start_4
    sget-object v25, Lcom/j256/ormlite/field/DataType;->ENUM_INTEGER:Lcom/j256/ormlite/field/DataType;

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setDataType(Lcom/j256/ormlite/field/DataType;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto/16 :goto_4

    .line 172
    .end local v18           #method:Ljava/lang/reflect/Method;
    .end local v22           #typeValue:Ljava/lang/Object;
    :catch_3
    move-exception v8

    .line 173
    .restart local v8       #e:Ljava/lang/Exception;
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Problem accessing fields from the @Enumerated annotation for field "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-static {v0, v8}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v25

    throw v25

    .line 184
    .end local v8           #e:Ljava/lang/Exception;
    :cond_1c
    const/16 v25, 0x0

    goto/16 :goto_5
.end method

.method public static getEntityName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 13
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p0, clazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v9, 0x0

    .line 194
    const/4 v4, 0x0

    .line 195
    .local v4, entityAnnotation:Ljava/lang/annotation/Annotation;
    invoke-virtual {p0}, Ljava/lang/Class;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v2

    .local v2, arr$:[Ljava/lang/annotation/Annotation;
    array-length v6, v2

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_0
    if-ge v5, v6, :cond_1

    aget-object v0, v2, v5

    .line 196
    .local v0, annotation:Ljava/lang/annotation/Annotation;
    invoke-interface {v0}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v1

    .line 197
    .local v1, annotationClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    const-string v11, "javax.persistence.Entity"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 198
    move-object v4, v0

    .line 195
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 202
    .end local v0           #annotation:Ljava/lang/annotation/Annotation;
    .end local v1           #annotationClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_1
    if-nez v4, :cond_3

    move-object v8, v9

    .line 211
    :cond_2
    :goto_1
    return-object v8

    .line 206
    :cond_3
    :try_start_0
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    const-string v11, "name"

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Class;

    invoke-virtual {v10, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 207
    .local v7, method:Ljava/lang/reflect/Method;
    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v7, v4, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 208
    .local v8, name:Ljava/lang/String;
    if-eqz v8, :cond_4

    invoke-virtual {v8}, Ljava/lang/String;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v10

    if-gtz v10, :cond_2

    :cond_4
    move-object v8, v9

    .line 211
    goto :goto_1

    .line 213
    .end local v7           #method:Ljava/lang/reflect/Method;
    .end local v8           #name:Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 214
    .local v3, e:Ljava/lang/Exception;
    new-instance v9, Ljava/lang/IllegalStateException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Could not get entity name from class "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9
.end method
