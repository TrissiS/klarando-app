.class public Lb/t/a/a/e;
.super Ljava/lang/Object;
.source "AnimatorInflaterCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/t/a/a/e$a;
    }
.end annotation


# direct methods
.method public static a(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;Lorg/xmlpull/v1/XmlPullParser;)I
    .registers 5

    .line 146
    sget-object v0, Lb/t/a/a/a;->j:[I

    invoke-static {p0, p1, p2, v0}, Lb/h/e/c/g;->a(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p0

    const/4 p1, 0x0

    const-string p2, "value"

    .line 147
    invoke-static {p0, p3, p2, p1}, Lb/h/e/c/g;->b(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Landroid/util/TypedValue;

    move-result-object p2

    if-eqz p2, :cond_11

    const/4 p3, 0x1

    goto :goto_12

    :cond_11
    const/4 p3, 0x0

    :goto_12
    if-eqz p3, :cond_1d

    .line 148
    iget p2, p2, Landroid/util/TypedValue;->type:I

    invoke-static {p2}, Lb/t/a/a/e;->a(I)Z

    move-result p2

    if-eqz p2, :cond_1d

    const/4 p1, 0x3

    .line 149
    :cond_1d
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    return p1
.end method

.method public static a(Landroid/content/res/TypedArray;II)I
    .registers 6

    .line 150
    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_a

    const/4 v2, 0x1

    goto :goto_b

    :cond_a
    const/4 v2, 0x0

    :goto_b
    if-eqz v2, :cond_10

    .line 151
    iget p1, p1, Landroid/util/TypedValue;->type:I

    goto :goto_11

    :cond_10
    const/4 p1, 0x0

    .line 152
    :goto_11
    invoke-virtual {p0, p2}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_18

    goto :goto_19

    :cond_18
    const/4 v0, 0x0

    :goto_19
    if-eqz v0, :cond_1e

    .line 153
    iget p0, p0, Landroid/util/TypedValue;->type:I

    goto :goto_1f

    :cond_1e
    const/4 p0, 0x0

    :goto_1f
    if-eqz v2, :cond_27

    .line 154
    invoke-static {p1}, Lb/t/a/a/e;->a(I)Z

    move-result p1

    if-nez p1, :cond_2f

    :cond_27
    if-eqz v0, :cond_30

    invoke-static {p0}, Lb/t/a/a/e;->a(I)Z

    move-result p0

    if-eqz p0, :cond_30

    :cond_2f
    const/4 v1, 0x3

    :cond_30
    return v1
.end method

.method public static a(Landroid/content/Context;I)Landroid/animation/Animator;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_b

    .line 2
    invoke-static {p0, p1}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object p0

    goto :goto_17

    .line 3
    :cond_b
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    invoke-static {p0, v0, v1, p1}, Lb/t/a/a/e;->a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;I)Landroid/animation/Animator;

    move-result-object p0

    :goto_17
    return-object p0
.end method

.method public static a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;I)Landroid/animation/Animator;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    invoke-static {p0, p1, p2, p3, v0}, Lb/t/a/a/e;->a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;IF)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;IF)Landroid/animation/Animator;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    const-string v0, "Can\'t load animation resource ID #0x"

    const/4 v1, 0x0

    .line 5
    :try_start_3
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getAnimation(I)Landroid/content/res/XmlResourceParser;

    move-result-object v1

    .line 6
    invoke-static {p0, p1, p2, v1, p4}, Lb/t/a/a/e;->a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;F)Landroid/animation/Animator;

    move-result-object p0
    :try_end_b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_b} :catch_30
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_b} :catch_13
    .catchall {:try_start_3 .. :try_end_b} :catchall_11

    if-eqz v1, :cond_10

    .line 7
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_10
    return-object p0

    :catchall_11
    move-exception p0

    goto :goto_4d

    :catch_13
    move-exception p0

    .line 8
    :try_start_14
    new-instance p1, Landroid/content/res/Resources$NotFoundException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    invoke-static {p3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    .line 10
    invoke-virtual {p1, p0}, Landroid/content/res/Resources$NotFoundException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 11
    throw p1

    :catch_30
    move-exception p0

    .line 12
    new-instance p1, Landroid/content/res/Resources$NotFoundException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    invoke-static {p3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    .line 14
    invoke-virtual {p1, p0}, Landroid/content/res/Resources$NotFoundException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 15
    throw p1
    :try_end_4d
    .catchall {:try_start_14 .. :try_end_4d} :catchall_11

    :goto_4d
    if-eqz v1, :cond_52

    .line 16
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    .line 17
    :cond_52
    throw p0
.end method

.method public static a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;F)Landroid/animation/Animator;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 103
    invoke-static {p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v7, p4

    invoke-static/range {v0 .. v7}, Lb/t/a/a/e;->a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/animation/AnimatorSet;IF)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/animation/AnimatorSet;IF)Landroid/animation/Animator;
    .registers 26
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p5

    .line 104
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v12

    const/4 v0, 0x0

    move-object v13, v0

    .line 105
    :cond_e
    :goto_e
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    const/4 v2, 0x3

    const/4 v14, 0x0

    if-ne v1, v2, :cond_1c

    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v2

    if-le v2, v12, :cond_dd

    :cond_1c
    const/4 v2, 0x1

    if-eq v1, v2, :cond_dd

    const/4 v3, 0x2

    if-eq v1, v3, :cond_23

    goto :goto_e

    .line 106
    :cond_23
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v3, "objectAnimator"

    .line 107
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_43

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move/from16 v4, p7

    move-object/from16 v5, p3

    .line 108
    invoke-static/range {v0 .. v5}, Lb/t/a/a/e;->a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;FLorg/xmlpull/v1/XmlPullParser;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    :goto_3f
    move-object/from16 v3, p0

    goto/16 :goto_b2

    :cond_43
    const-string v3, "animator"

    .line 109
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5d

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move/from16 v5, p7

    move-object/from16 v6, p3

    .line 110
    invoke-static/range {v0 .. v6}, Lb/t/a/a/e;->a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;Landroid/animation/ValueAnimator;FLorg/xmlpull/v1/XmlPullParser;)Landroid/animation/ValueAnimator;

    move-result-object v0

    goto :goto_3f

    :cond_5d
    const-string v3, "set"

    .line 111
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_93

    .line 112
    new-instance v15, Landroid/animation/AnimatorSet;

    invoke-direct {v15}, Landroid/animation/AnimatorSet;-><init>()V

    .line 113
    sget-object v0, Lb/t/a/a/a;->h:[I

    move-object/from16 v7, p4

    invoke-static {v8, v9, v7, v0}, Lb/h/e/c/g;->a(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v6

    const-string v0, "ordering"

    .line 114
    invoke-static {v6, v10, v0, v14, v14}, Lb/h/e/c/g;->b(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object v5, v15

    move-object/from16 v17, v6

    move/from16 v6, v16

    move/from16 v7, p7

    .line 115
    invoke-static/range {v0 .. v7}, Lb/t/a/a/e;->a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/animation/AnimatorSet;IF)Landroid/animation/Animator;

    .line 116
    invoke-virtual/range {v17 .. v17}, Landroid/content/res/TypedArray;->recycle()V

    move-object/from16 v3, p0

    move-object v0, v15

    goto :goto_b2

    :cond_93
    const-string v3, "propertyValuesHolder"

    .line 117
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c2

    .line 118
    invoke-static/range {p3 .. p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v1

    move-object/from16 v3, p0

    .line 119
    invoke-static {v3, v8, v9, v10, v1}, Lb/t/a/a/e;->a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;)[Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    if-eqz v1, :cond_b1

    .line 120
    instance-of v4, v0, Landroid/animation/ValueAnimator;

    if-eqz v4, :cond_b1

    .line 121
    move-object v4, v0

    check-cast v4, Landroid/animation/ValueAnimator;

    invoke-virtual {v4, v1}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    :cond_b1
    const/4 v14, 0x1

    :goto_b2
    if-eqz v11, :cond_e

    if-nez v14, :cond_e

    if-nez v13, :cond_bd

    .line 122
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 123
    :cond_bd
    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_e

    .line 124
    :cond_c2
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown animator name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_dd
    if-eqz v11, :cond_106

    if-eqz v13, :cond_106

    .line 125
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Landroid/animation/Animator;

    .line 126
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_eb
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_fd

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/animation/Animator;

    add-int/lit8 v4, v14, 0x1

    .line 127
    aput-object v3, v1, v14

    move v14, v4

    goto :goto_eb

    :cond_fd
    if-nez p6, :cond_103

    .line 128
    invoke-virtual {v11, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    goto :goto_106

    .line 129
    :cond_103
    invoke-virtual {v11, v1}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    :cond_106
    :goto_106
    return-object v0
.end method

.method public static a(Landroid/animation/Keyframe;F)Landroid/animation/Keyframe;
    .registers 4

    .line 184
    invoke-virtual {p0}, Landroid/animation/Keyframe;->getType()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_d

    .line 185
    invoke-static {p1}, Landroid/animation/Keyframe;->ofFloat(F)Landroid/animation/Keyframe;

    move-result-object p0

    goto :goto_1e

    .line 186
    :cond_d
    invoke-virtual {p0}, Landroid/animation/Keyframe;->getType()Ljava/lang/Class;

    move-result-object p0

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_1a

    .line 187
    invoke-static {p1}, Landroid/animation/Keyframe;->ofInt(F)Landroid/animation/Keyframe;

    move-result-object p0

    goto :goto_1e

    .line 188
    :cond_1a
    invoke-static {p1}, Landroid/animation/Keyframe;->ofObject(F)Landroid/animation/Keyframe;

    move-result-object p0

    :goto_1e
    return-object p0
.end method

.method public static a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;ILorg/xmlpull/v1/XmlPullParser;)Landroid/animation/Keyframe;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 190
    sget-object v0, Lb/t/a/a/a;->j:[I

    invoke-static {p1, p2, p3, v0}, Lb/h/e/c/g;->a(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x3

    const-string p3, "fraction"

    const/high16 v0, -0x40800000    # -1.0f

    .line 191
    invoke-static {p1, p5, p3, p2, v0}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result p3

    const-string v0, "value"

    const/4 v1, 0x0

    .line 192
    invoke-static {p1, p5, v0, v1}, Lb/h/e/c/g;->b(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Landroid/util/TypedValue;

    move-result-object v2

    const/4 v3, 0x1

    if-eqz v2, :cond_1b

    const/4 v4, 0x1

    goto :goto_1c

    :cond_1b
    const/4 v4, 0x0

    :goto_1c
    const/4 v5, 0x4

    if-ne p4, v5, :cond_2c

    if-eqz v4, :cond_2b

    .line 193
    iget p4, v2, Landroid/util/TypedValue;->type:I

    invoke-static {p4}, Lb/t/a/a/e;->a(I)Z

    move-result p4

    if-eqz p4, :cond_2b

    const/4 p4, 0x3

    goto :goto_2c

    :cond_2b
    const/4 p4, 0x0

    :cond_2c
    :goto_2c
    if-eqz v4, :cond_49

    if-eqz p4, :cond_3f

    if-eq p4, v3, :cond_36

    if-eq p4, p2, :cond_36

    const/4 p2, 0x0

    goto :goto_54

    .line 194
    :cond_36
    invoke-static {p1, p5, v0, v1, v1}, Lb/h/e/c/g;->b(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result p2

    .line 195
    invoke-static {p3, p2}, Landroid/animation/Keyframe;->ofInt(FI)Landroid/animation/Keyframe;

    move-result-object p2

    goto :goto_54

    :cond_3f
    const/4 p2, 0x0

    .line 196
    invoke-static {p1, p5, v0, v1, p2}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result p2

    .line 197
    invoke-static {p3, p2}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object p2

    goto :goto_54

    :cond_49
    if-nez p4, :cond_50

    .line 198
    invoke-static {p3}, Landroid/animation/Keyframe;->ofFloat(F)Landroid/animation/Keyframe;

    move-result-object p2

    goto :goto_54

    .line 199
    :cond_50
    invoke-static {p3}, Landroid/animation/Keyframe;->ofInt(F)Landroid/animation/Keyframe;

    move-result-object p2

    :goto_54
    const-string p3, "interpolator"

    .line 200
    invoke-static {p1, p5, p3, v3, v1}, Lb/h/e/c/g;->c(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result p3

    if-lez p3, :cond_63

    .line 201
    invoke-static {p0, p3}, Lb/t/a/a/d;->a(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object p0

    .line 202
    invoke-virtual {p2, p0}, Landroid/animation/Keyframe;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 203
    :cond_63
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-object p2
.end method

.method public static a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;FLorg/xmlpull/v1/XmlPullParser;)Landroid/animation/ObjectAnimator;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .line 204
    new-instance v7, Landroid/animation/ObjectAnimator;

    invoke-direct {v7}, Landroid/animation/ObjectAnimator;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, v7

    move v5, p4

    move-object v6, p5

    .line 205
    invoke-static/range {v0 .. v6}, Lb/t/a/a/e;->a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;Landroid/animation/ValueAnimator;FLorg/xmlpull/v1/XmlPullParser;)Landroid/animation/ValueAnimator;

    return-object v7
.end method

.method public static a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Landroid/animation/PropertyValuesHolder;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    move-object v1, v0

    .line 155
    :cond_2
    :goto_2
    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_40

    const/4 v4, 0x1

    if-eq v2, v4, :cond_40

    .line 156
    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "keyframe"

    .line 157
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x4

    if-ne p5, v2, :cond_23

    .line 158
    invoke-static {p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object p5

    invoke-static {p1, p2, p5, p3}, Lb/t/a/a/e;->a(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;Lorg/xmlpull/v1/XmlPullParser;)I

    move-result p5

    .line 159
    :cond_23
    invoke-static {p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v5

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v6, p5

    move-object v7, p3

    invoke-static/range {v2 .. v7}, Lb/t/a/a/e;->a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;ILorg/xmlpull/v1/XmlPullParser;)Landroid/animation/Keyframe;

    move-result-object v2

    if-eqz v2, :cond_3c

    if-nez v1, :cond_39

    .line 160
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 161
    :cond_39
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    :cond_3c
    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    goto :goto_2

    :cond_40
    if-eqz v1, :cond_e9

    .line 163
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-lez p0, :cond_e9

    const/4 p1, 0x0

    .line 164
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/animation/Keyframe;

    add-int/lit8 p3, p0, -0x1

    .line 165
    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/animation/Keyframe;

    .line 166
    invoke-virtual {p3}, Landroid/animation/Keyframe;->getFraction()F

    move-result v0

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    cmpg-float v5, v0, v2

    if-gez v5, :cond_77

    cmpg-float v0, v0, v4

    if-gez v0, :cond_6a

    .line 167
    invoke-virtual {p3, v2}, Landroid/animation/Keyframe;->setFraction(F)V

    goto :goto_77

    .line 168
    :cond_6a
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {p3, v2}, Lb/t/a/a/e;->a(Landroid/animation/Keyframe;F)Landroid/animation/Keyframe;

    move-result-object p3

    invoke-virtual {v1, v0, p3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    add-int/lit8 p0, p0, 0x1

    .line 169
    :cond_77
    :goto_77
    invoke-virtual {p2}, Landroid/animation/Keyframe;->getFraction()F

    move-result p3

    cmpl-float v0, p3, v4

    if-eqz v0, :cond_90

    cmpg-float p3, p3, v4

    if-gez p3, :cond_87

    .line 170
    invoke-virtual {p2, v4}, Landroid/animation/Keyframe;->setFraction(F)V

    goto :goto_90

    .line 171
    :cond_87
    invoke-static {p2, v4}, Lb/t/a/a/e;->a(Landroid/animation/Keyframe;F)Landroid/animation/Keyframe;

    move-result-object p2

    invoke-virtual {v1, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    add-int/lit8 p0, p0, 0x1

    .line 172
    :cond_90
    :goto_90
    new-array p2, p0, [Landroid/animation/Keyframe;

    .line 173
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    :goto_95
    if-ge p1, p0, :cond_dc

    .line 174
    aget-object p3, p2, p1

    .line 175
    invoke-virtual {p3}, Landroid/animation/Keyframe;->getFraction()F

    move-result v0

    cmpg-float v0, v0, v4

    if-gez v0, :cond_d9

    if-nez p1, :cond_a7

    .line 176
    invoke-virtual {p3, v4}, Landroid/animation/Keyframe;->setFraction(F)V

    goto :goto_d9

    :cond_a7
    add-int/lit8 v0, p0, -0x1

    if-ne p1, v0, :cond_af

    .line 177
    invoke-virtual {p3, v2}, Landroid/animation/Keyframe;->setFraction(F)V

    goto :goto_d9

    :cond_af
    add-int/lit8 p3, p1, 0x1

    move v1, p1

    :goto_b2
    if-ge p3, v0, :cond_c5

    .line 178
    aget-object v5, p2, p3

    invoke-virtual {v5}, Landroid/animation/Keyframe;->getFraction()F

    move-result v5

    cmpl-float v5, v5, v4

    if-ltz v5, :cond_bf

    goto :goto_c5

    :cond_bf
    add-int/lit8 v1, p3, 0x1

    move v8, v1

    move v1, p3

    move p3, v8

    goto :goto_b2

    :cond_c5
    :goto_c5
    add-int/lit8 p3, v1, 0x1

    .line 179
    aget-object p3, p2, p3

    invoke-virtual {p3}, Landroid/animation/Keyframe;->getFraction()F

    move-result p3

    add-int/lit8 v0, p1, -0x1

    aget-object v0, p2, v0

    .line 180
    invoke-virtual {v0}, Landroid/animation/Keyframe;->getFraction()F

    move-result v0

    sub-float/2addr p3, v0

    .line 181
    invoke-static {p2, p3, p1, v1}, Lb/t/a/a/e;->a([Landroid/animation/Keyframe;FII)V

    :cond_d9
    :goto_d9
    add-int/lit8 p1, p1, 0x1

    goto :goto_95

    .line 182
    :cond_dc
    invoke-static {p4, p2}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    if-ne p5, v3, :cond_e9

    .line 183
    invoke-static {}, Lb/t/a/a/f;->a()Lb/t/a/a/f;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    :cond_e9
    return-object v0
.end method

.method public static a(Landroid/content/res/TypedArray;IIILjava/lang/String;)Landroid/animation/PropertyValuesHolder;
    .registers 16

    .line 18
    invoke-virtual {p0, p2}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_a

    const/4 v3, 0x1

    goto :goto_b

    :cond_a
    const/4 v3, 0x0

    :goto_b
    if-eqz v3, :cond_10

    .line 19
    iget v0, v0, Landroid/util/TypedValue;->type:I

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    .line 20
    :goto_11
    invoke-virtual {p0, p3}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v4

    if-eqz v4, :cond_19

    const/4 v5, 0x1

    goto :goto_1a

    :cond_19
    const/4 v5, 0x0

    :goto_1a
    if-eqz v5, :cond_1f

    .line 21
    iget v4, v4, Landroid/util/TypedValue;->type:I

    goto :goto_20

    :cond_1f
    const/4 v4, 0x0

    :goto_20
    const/4 v6, 0x4

    const/4 v7, 0x3

    if-ne p1, v6, :cond_37

    if-eqz v3, :cond_2c

    .line 22
    invoke-static {v0}, Lb/t/a/a/e;->a(I)Z

    move-result p1

    if-nez p1, :cond_34

    :cond_2c
    if-eqz v5, :cond_36

    invoke-static {v4}, Lb/t/a/a/e;->a(I)Z

    move-result p1

    if-eqz p1, :cond_36

    :cond_34
    const/4 p1, 0x3

    goto :goto_37

    :cond_36
    const/4 p1, 0x0

    :cond_37
    :goto_37
    if-nez p1, :cond_3b

    const/4 v6, 0x1

    goto :goto_3c

    :cond_3b
    const/4 v6, 0x0

    :goto_3c
    const/4 v8, 0x0

    const/4 v9, 0x2

    if-ne p1, v9, :cond_a9

    .line 23
    invoke-virtual {p0, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 24
    invoke-virtual {p0, p3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 25
    invoke-static {p1}, Lb/h/f/c;->a(Ljava/lang/String;)[Lb/h/f/c$b;

    move-result-object p2

    .line 26
    invoke-static {p0}, Lb/h/f/c;->a(Ljava/lang/String;)[Lb/h/f/c$b;

    move-result-object p3

    if-nez p2, :cond_54

    if-eqz p3, :cond_167

    :cond_54
    if-eqz p2, :cond_98

    .line 27
    new-instance v0, Lb/t/a/a/e$a;

    invoke-direct {v0}, Lb/t/a/a/e$a;-><init>()V

    if-eqz p3, :cond_8d

    .line 28
    invoke-static {p2, p3}, Lb/h/f/c;->a([Lb/h/f/c$b;[Lb/h/f/c$b;)Z

    move-result v3

    if-eqz v3, :cond_6e

    new-array p0, v9, [Ljava/lang/Object;

    aput-object p2, p0, v2

    aput-object p3, p0, v1

    .line 29
    invoke-static {p4, v0, p0}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    move-result-object p0

    goto :goto_95

    .line 30
    :cond_6e
    new-instance p2, Landroid/view/InflateException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, " Can\'t morph from "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " to "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Landroid/view/InflateException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_8d
    new-array p0, v1, [Ljava/lang/Object;

    aput-object p2, p0, v2

    .line 31
    invoke-static {p4, v0, p0}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    move-result-object p0

    :goto_95
    move-object v8, p0

    goto/16 :goto_167

    :cond_98
    if-eqz p3, :cond_167

    .line 32
    new-instance p0, Lb/t/a/a/e$a;

    invoke-direct {p0}, Lb/t/a/a/e$a;-><init>()V

    new-array p1, v1, [Ljava/lang/Object;

    aput-object p3, p1, v2

    .line 33
    invoke-static {p4, p0, p1}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    goto/16 :goto_167

    :cond_a9
    if-ne p1, v7, :cond_b0

    .line 34
    invoke-static {}, Lb/t/a/a/f;->a()Lb/t/a/a/f;

    move-result-object p1

    goto :goto_b1

    :cond_b0
    move-object p1, v8

    :goto_b1
    const/4 v7, 0x5

    const/4 v10, 0x0

    if-eqz v6, :cond_f9

    if-eqz v3, :cond_e3

    if-ne v0, v7, :cond_be

    .line 35
    invoke-virtual {p0, p2, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    goto :goto_c2

    .line 36
    :cond_be
    invoke-virtual {p0, p2, v10}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    :goto_c2
    if-eqz v5, :cond_da

    if-ne v4, v7, :cond_cb

    .line 37
    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p0

    goto :goto_cf

    .line 38
    :cond_cb
    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p0

    :goto_cf
    new-array p3, v9, [F

    aput p2, p3, v2

    aput p0, p3, v1

    .line 39
    invoke-static {p4, p3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p0

    goto :goto_f6

    :cond_da
    new-array p0, v1, [F

    aput p2, p0, v2

    .line 40
    invoke-static {p4, p0}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p0

    goto :goto_f6

    :cond_e3
    if-ne v4, v7, :cond_ea

    .line 41
    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p0

    goto :goto_ee

    .line 42
    :cond_ea
    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p0

    :goto_ee
    new-array p2, v1, [F

    aput p0, p2, v2

    .line 43
    invoke-static {p4, p2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p0

    :goto_f6
    move-object v8, p0

    goto/16 :goto_160

    :cond_f9
    if-eqz v3, :cond_13f

    if-ne v0, v7, :cond_103

    .line 44
    invoke-virtual {p0, p2, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    float-to-int p2, p2

    goto :goto_112

    .line 45
    :cond_103
    invoke-static {v0}, Lb/t/a/a/e;->a(I)Z

    move-result v0

    if-eqz v0, :cond_10e

    .line 46
    invoke-virtual {p0, p2, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    goto :goto_112

    .line 47
    :cond_10e
    invoke-virtual {p0, p2, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    :goto_112
    if-eqz v5, :cond_136

    if-ne v4, v7, :cond_11c

    .line 48
    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p0

    float-to-int p0, p0

    goto :goto_12b

    .line 49
    :cond_11c
    invoke-static {v4}, Lb/t/a/a/e;->a(I)Z

    move-result v0

    if-eqz v0, :cond_127

    .line 50
    invoke-virtual {p0, p3, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p0

    goto :goto_12b

    .line 51
    :cond_127
    invoke-virtual {p0, p3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p0

    :goto_12b
    new-array p3, v9, [I

    aput p2, p3, v2

    aput p0, p3, v1

    .line 52
    invoke-static {p4, p3}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    goto :goto_160

    :cond_136
    new-array p0, v1, [I

    aput p2, p0, v2

    .line 53
    invoke-static {p4, p0}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    goto :goto_160

    :cond_13f
    if-eqz v5, :cond_160

    if-ne v4, v7, :cond_149

    .line 54
    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p0

    float-to-int p0, p0

    goto :goto_158

    .line 55
    :cond_149
    invoke-static {v4}, Lb/t/a/a/e;->a(I)Z

    move-result p2

    if-eqz p2, :cond_154

    .line 56
    invoke-virtual {p0, p3, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p0

    goto :goto_158

    .line 57
    :cond_154
    invoke-virtual {p0, p3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p0

    :goto_158
    new-array p2, v1, [I

    aput p0, p2, v2

    .line 58
    invoke-static {p4, p2}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    :cond_160
    :goto_160
    if-eqz v8, :cond_167

    if-eqz p1, :cond_167

    .line 59
    invoke-virtual {v8, p1}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    :cond_167
    :goto_167
    return-object v8
.end method

.method public static a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;Landroid/animation/ValueAnimator;FLorg/xmlpull/v1/XmlPullParser;)Landroid/animation/ValueAnimator;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .line 206
    sget-object v0, Lb/t/a/a/a;->g:[I

    invoke-static {p1, p2, p3, v0}, Lb/h/e/c/g;->a(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 207
    sget-object v1, Lb/t/a/a/a;->k:[I

    invoke-static {p1, p2, p3, v1}, Lb/h/e/c/g;->a(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    if-nez p4, :cond_13

    .line 208
    new-instance p4, Landroid/animation/ValueAnimator;

    invoke-direct {p4}, Landroid/animation/ValueAnimator;-><init>()V

    .line 209
    :cond_13
    invoke-static {p4, v0, p1, p5, p6}, Lb/t/a/a/e;->a(Landroid/animation/ValueAnimator;Landroid/content/res/TypedArray;Landroid/content/res/TypedArray;FLorg/xmlpull/v1/XmlPullParser;)V

    const/4 p2, 0x0

    const-string p3, "interpolator"

    .line 210
    invoke-static {v0, p6, p3, p2, p2}, Lb/h/e/c/g;->c(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result p2

    if-lez p2, :cond_26

    .line 211
    invoke-static {p0, p2}, Lb/t/a/a/d;->a(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object p0

    .line 212
    invoke-virtual {p4, p0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 213
    :cond_26
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz p1, :cond_2e

    .line 214
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    :cond_2e
    return-object p4
.end method

.method public static a(Landroid/animation/ValueAnimator;Landroid/content/res/TypedArray;IFLorg/xmlpull/v1/XmlPullParser;)V
    .registers 10

    .line 73
    check-cast p0, Landroid/animation/ObjectAnimator;

    const-string v0, "pathData"

    const/4 v1, 0x1

    .line 74
    invoke-static {p1, p4, v0, v1}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_48

    const/4 v1, 0x2

    const-string v2, "propertyXName"

    .line 75
    invoke-static {p1, p4, v2, v1}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    const-string v4, "propertyYName"

    .line 76
    invoke-static {p1, p4, v4, v3}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p4

    if-eq p2, v1, :cond_1c

    const/4 v1, 0x4

    :cond_1c
    if-nez v2, :cond_3c

    if-eqz p4, :cond_21

    goto :goto_3c

    .line 77
    :cond_21
    new-instance p0, Landroid/view/InflateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getPositionDescription()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " propertyXName or propertyYName is needed for PathData"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/view/InflateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 78
    :cond_3c
    :goto_3c
    invoke-static {v0}, Lb/h/f/c;->b(Ljava/lang/String;)Landroid/graphics/Path;

    move-result-object p1

    const/high16 p2, 0x3f000000    # 0.5f

    mul-float p3, p3, p2

    .line 79
    invoke-static {p1, p0, p3, v2, p4}, Lb/t/a/a/e;->a(Landroid/graphics/Path;Landroid/animation/ObjectAnimator;FLjava/lang/String;Ljava/lang/String;)V

    goto :goto_52

    :cond_48
    const/4 p2, 0x0

    const-string p3, "propertyName"

    .line 80
    invoke-static {p1, p4, p3, p2}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    .line 81
    invoke-virtual {p0, p1}, Landroid/animation/ObjectAnimator;->setPropertyName(Ljava/lang/String;)V

    :goto_52
    return-void
.end method

.method public static a(Landroid/animation/ValueAnimator;Landroid/content/res/TypedArray;Landroid/content/res/TypedArray;FLorg/xmlpull/v1/XmlPullParser;)V
    .registers 16

    const/4 v0, 0x1

    const-string v1, "duration"

    const/16 v2, 0x12c

    .line 60
    invoke-static {p1, p4, v1, v0, v2}, Lb/h/e/c/g;->b(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v1

    int-to-long v1, v1

    const/4 v3, 0x0

    const-string v4, "startOffset"

    const/4 v5, 0x2

    .line 61
    invoke-static {p1, p4, v4, v5, v3}, Lb/h/e/c/g;->b(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v4

    int-to-long v4, v4

    const/4 v6, 0x4

    const-string v7, "valueType"

    const/4 v8, 0x7

    .line 62
    invoke-static {p1, p4, v7, v8, v6}, Lb/h/e/c/g;->b(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v7

    const-string v8, "valueFrom"

    .line 63
    invoke-static {p4, v8}, Lb/h/e/c/g;->a(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_42

    const-string v8, "valueTo"

    .line 64
    invoke-static {p4, v8}, Lb/h/e/c/g;->a(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_42

    const/4 v8, 0x6

    const/4 v9, 0x5

    if-ne v7, v6, :cond_33

    .line 65
    invoke-static {p1, v9, v8}, Lb/t/a/a/e;->a(Landroid/content/res/TypedArray;II)I

    move-result v7

    :cond_33
    const-string v10, ""

    .line 66
    invoke-static {p1, v7, v9, v8, v10}, Lb/t/a/a/e;->a(Landroid/content/res/TypedArray;IIILjava/lang/String;)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    if-eqz v8, :cond_42

    new-array v9, v0, [Landroid/animation/PropertyValuesHolder;

    aput-object v8, v9, v3

    .line 67
    invoke-virtual {p0, v9}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    .line 68
    :cond_42
    invoke-virtual {p0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 69
    invoke-virtual {p0, v4, v5}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    const/4 v1, 0x3

    const-string v2, "repeatCount"

    .line 70
    invoke-static {p1, p4, v2, v1, v3}, Lb/h/e/c/g;->b(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    const-string v1, "repeatMode"

    .line 71
    invoke-static {p1, p4, v1, v6, v0}, Lb/h/e/c/g;->b(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    if-eqz p2, :cond_60

    .line 72
    invoke-static {p0, p2, v7, p3, p4}, Lb/t/a/a/e;->a(Landroid/animation/ValueAnimator;Landroid/content/res/TypedArray;IFLorg/xmlpull/v1/XmlPullParser;)V

    :cond_60
    return-void
.end method

.method public static a(Landroid/graphics/Path;Landroid/animation/ObjectAnimator;FLjava/lang/String;Ljava/lang/String;)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    .line 82
    new-instance v4, Landroid/graphics/PathMeasure;

    const/4 v5, 0x0

    invoke-direct {v4, v0, v5}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    .line 83
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    const/4 v7, 0x0

    .line 84
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v8, 0x0

    .line 85
    :cond_1c
    invoke-virtual {v4}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v9

    add-float/2addr v8, v9

    .line 86
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    invoke-virtual {v4}, Landroid/graphics/PathMeasure;->nextContour()Z

    move-result v9

    if-nez v9, :cond_1c

    .line 88
    new-instance v4, Landroid/graphics/PathMeasure;

    invoke-direct {v4, v0, v5}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    const/16 v0, 0x64

    div-float v9, v8, p2

    float-to-int v9, v9

    const/4 v10, 0x1

    add-int/2addr v9, v10

    .line 89
    invoke-static {v0, v9}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 90
    new-array v9, v0, [F

    .line 91
    new-array v11, v0, [F

    const/4 v12, 0x2

    new-array v13, v12, [F

    add-int/lit8 v14, v0, -0x1

    int-to-float v14, v14

    div-float/2addr v8, v14

    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_4b
    const/4 v12, 0x0

    if-ge v14, v0, :cond_85

    .line 92
    invoke-virtual {v6, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Float;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Float;->floatValue()F

    move-result v16

    sub-float v10, v7, v16

    invoke-virtual {v4, v10, v13, v12}, Landroid/graphics/PathMeasure;->getPosTan(F[F[F)Z

    .line 93
    aget v10, v13, v5

    aput v10, v9, v14

    const/4 v10, 0x1

    .line 94
    aget v12, v13, v10

    aput v12, v11, v14

    add-float/2addr v7, v8

    add-int/lit8 v10, v15, 0x1

    .line 95
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ge v10, v12, :cond_81

    .line 96
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Float;

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    cmpl-float v12, v7, v12

    if-lez v12, :cond_81

    .line 97
    invoke-virtual {v4}, Landroid/graphics/PathMeasure;->nextContour()Z

    move v15, v10

    :cond_81
    add-int/lit8 v14, v14, 0x1

    const/4 v10, 0x1

    goto :goto_4b

    :cond_85
    if-eqz v2, :cond_8c

    .line 98
    invoke-static {v2, v9}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    goto :goto_8d

    :cond_8c
    move-object v0, v12

    :goto_8d
    if-eqz v3, :cond_93

    .line 99
    invoke-static {v3, v11}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v12

    :cond_93
    if-nez v0, :cond_9e

    const/4 v2, 0x1

    new-array v0, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object v12, v0, v5

    .line 100
    invoke-virtual {v1, v0}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    goto :goto_b3

    :cond_9e
    const/4 v2, 0x1

    if-nez v12, :cond_a9

    new-array v2, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v2, v5

    .line 101
    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    goto :goto_b3

    :cond_a9
    const/4 v3, 0x2

    new-array v3, v3, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v3, v5

    aput-object v12, v3, v2

    .line 102
    invoke-virtual {v1, v3}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    :goto_b3
    return-void
.end method

.method public static a([Landroid/animation/Keyframe;FII)V
    .registers 6

    sub-int v0, p3, p2

    add-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    div-float/2addr p1, v0

    :goto_6
    if-gt p2, p3, :cond_19

    .line 189
    aget-object v0, p0, p2

    add-int/lit8 v1, p2, -0x1

    aget-object v1, p0, v1

    invoke-virtual {v1}, Landroid/animation/Keyframe;->getFraction()F

    move-result v1

    add-float/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/animation/Keyframe;->setFraction(F)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_6

    :cond_19
    return-void
.end method

.method public static a(I)Z
    .registers 2

    const/16 v0, 0x1c

    if-lt p0, v0, :cond_a

    const/16 v0, 0x1f

    if-gt p0, v0, :cond_a

    const/4 p0, 0x1

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    return p0
.end method

.method public static a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;)[Landroid/animation/PropertyValuesHolder;
    .registers 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v6, p3

    const/4 v7, 0x0

    move-object v8, v7

    .line 130
    :goto_4
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v9, 0x0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_6d

    const/4 v10, 0x1

    if-eq v0, v10, :cond_6d

    const/4 v2, 0x2

    if-eq v0, v2, :cond_16

    .line 131
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    goto :goto_4

    .line 132
    :cond_16
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v3, "propertyValuesHolder"

    .line 133
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_63

    .line 134
    sget-object v0, Lb/t/a/a/a;->i:[I

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v13, p4

    invoke-static {v11, v12, v13, v0}, Lb/h/e/c/g;->a(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v14

    const-string v0, "propertyName"

    .line 135
    invoke-static {v14, v6, v0, v1}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v15

    const/4 v0, 0x4

    const-string v1, "valueType"

    .line 136
    invoke-static {v14, v6, v1, v2, v0}, Lb/h/e/c/g;->b(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v5

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object v4, v15

    move/from16 v16, v5

    .line 137
    invoke-static/range {v0 .. v5}, Lb/t/a/a/e;->a(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    if-nez v0, :cond_52

    move/from16 v1, v16

    .line 138
    invoke-static {v14, v1, v9, v10, v15}, Lb/t/a/a/e;->a(Landroid/content/res/TypedArray;IIILjava/lang/String;)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    :cond_52
    if-eqz v0, :cond_5f

    if-nez v8, :cond_5c

    .line 139
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object v8, v1

    .line 140
    :cond_5c
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    :cond_5f
    invoke-virtual {v14}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_69

    :cond_63
    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v13, p4

    .line 142
    :goto_69
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    goto :goto_4

    :cond_6d
    if-eqz v8, :cond_82

    .line 143
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 144
    new-array v7, v0, [Landroid/animation/PropertyValuesHolder;

    :goto_75
    if-ge v9, v0, :cond_82

    .line 145
    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/PropertyValuesHolder;

    aput-object v1, v7, v9

    add-int/lit8 v9, v9, 0x1

    goto :goto_75

    :cond_82
    return-object v7
.end method
