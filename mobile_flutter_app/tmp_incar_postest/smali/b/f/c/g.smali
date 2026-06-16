.class public Lb/f/c/g;
.super Ljava/lang/Object;
.source "StateSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/c/g$b;,
        Lb/f/c/g$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lb/f/c/g$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lb/f/c/g;->a:I

    .line 3
    iput v0, p0, Lb/f/c/g;->b:I

    .line 4
    iput v0, p0, Lb/f/c/g;->c:I

    .line 5
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lb/f/c/g;->d:Landroid/util/SparseArray;

    .line 6
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 7
    invoke-virtual {p0, p1, p2}, Lb/f/c/g;->a(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    return-void
.end method


# virtual methods
.method public a(IIFF)I
    .registers 9

    .line 21
    iget-object v0, p0, Lb/f/c/g;->d:Landroid/util/SparseArray;

    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/c/g$a;

    if-nez v0, :cond_b

    return p2

    :cond_b
    const/high16 p2, -0x40800000    # -1.0f

    cmpl-float v1, p3, p2

    if-eqz v1, :cond_3e

    cmpl-float p2, p4, p2

    if-nez p2, :cond_16

    goto :goto_3e

    :cond_16
    const/4 p2, 0x0

    .line 22
    iget-object v1, v0, Lb/f/c/g$a;->b:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1d
    :goto_1d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_36

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/c/g$b;

    .line 23
    invoke-virtual {v2, p3, p4}, Lb/f/c/g$b;->a(FF)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 24
    iget p2, v2, Lb/f/c/g$b;->e:I

    if-ne p1, p2, :cond_34

    return p1

    :cond_34
    move-object p2, v2

    goto :goto_1d

    :cond_36
    if-eqz p2, :cond_3b

    .line 25
    iget p1, p2, Lb/f/c/g$b;->e:I

    return p1

    .line 26
    :cond_3b
    iget p1, v0, Lb/f/c/g$a;->c:I

    return p1

    .line 27
    :cond_3e
    :goto_3e
    iget p2, v0, Lb/f/c/g$a;->c:I

    if-ne p2, p1, :cond_43

    return p1

    .line 28
    :cond_43
    iget-object p2, v0, Lb/f/c/g$a;->b:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_49
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_5a

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lb/f/c/g$b;

    .line 29
    iget p3, p3, Lb/f/c/g$b;->e:I

    if-ne p1, p3, :cond_49

    return p1

    .line 30
    :cond_5a
    iget p1, v0, Lb/f/c/g$a;->c:I

    return p1
.end method

.method public a(III)I
    .registers 5

    int-to-float p2, p2

    int-to-float p3, p3

    const/4 v0, -0x1

    .line 20
    invoke-virtual {p0, v0, p1, p2, p3}, Lb/f/c/g;->b(IIFF)I

    move-result p1

    return p1
.end method

.method public final a(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 12

    .line 1
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v0

    .line 2
    sget-object v1, Lb/f/c/f;->StateSet:[I

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_10
    if-ge v3, v1, :cond_25

    .line 4
    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v4

    .line 5
    sget v5, Lb/f/c/f;->StateSet_defaultState:I

    if-ne v4, v5, :cond_22

    .line 6
    iget v5, p0, Lb/f/c/g;->a:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    iput v4, p0, Lb/f/c/g;->a:I

    :cond_22
    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    :cond_25
    const/4 v0, 0x0

    .line 7
    :try_start_26
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1
    :try_end_2a
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_26 .. :try_end_2a} :catch_bb
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_2a} :catch_b6

    :goto_2a
    const/4 v3, 0x1

    if-eq v1, v3, :cond_bf

    if-eqz v1, :cond_ad

    const-string v4, "StateSet"

    const/4 v5, 0x3

    const/4 v6, 0x2

    if-eq v1, v6, :cond_44

    if-eq v1, v5, :cond_39

    goto/16 :goto_b0

    .line 8
    :cond_39
    :try_start_39
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b0

    return-void

    .line 9
    :cond_44
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v7, -0x1

    .line 10
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v8

    sparse-switch v8, :sswitch_data_c0

    goto :goto_76

    :sswitch_51
    const-string v4, "Variant"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_76

    const/4 v7, 0x3

    goto :goto_76

    :sswitch_5b
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_76

    const/4 v7, 0x1

    goto :goto_76

    :sswitch_63
    const-string v4, "LayoutDescription"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_76

    const/4 v7, 0x0

    goto :goto_76

    :sswitch_6d
    const-string v4, "State"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_76

    const/4 v7, 0x2

    :cond_76
    :goto_76
    if-eqz v7, :cond_b0

    if-eq v7, v3, :cond_b0

    if-eq v7, v6, :cond_a0

    if-eq v7, v5, :cond_95

    const-string v3, "ConstraintLayoutStates"

    .line 11
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unknown tag "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b0

    .line 12
    :cond_95
    new-instance v1, Lb/f/c/g$b;

    invoke-direct {v1, p1, p2}, Lb/f/c/g$b;-><init>(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    if-eqz v0, :cond_b0

    .line 13
    invoke-virtual {v0, v1}, Lb/f/c/g$a;->a(Lb/f/c/g$b;)V

    goto :goto_b0

    .line 14
    :cond_a0
    new-instance v0, Lb/f/c/g$a;

    invoke-direct {v0, p1, p2}, Lb/f/c/g$a;-><init>(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 15
    iget-object v1, p0, Lb/f/c/g;->d:Landroid/util/SparseArray;

    iget v3, v0, Lb/f/c/g$a;->a:I

    invoke-virtual {v1, v3, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_b0

    .line 16
    :cond_ad
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 17
    :cond_b0
    :goto_b0
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1
    :try_end_b4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_39 .. :try_end_b4} :catch_bb
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_b4} :catch_b6

    goto/16 :goto_2a

    :catch_b6
    move-exception p1

    .line 18
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_bf

    :catch_bb
    move-exception p1

    .line 19
    invoke-virtual {p1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    :cond_bf
    :goto_bf
    return-void

    :sswitch_data_c0
    .sparse-switch
        0x4c7d471 -> :sswitch_6d
        0x4d92b252 -> :sswitch_63
        0x526c4e31 -> :sswitch_5b
        0x7155a865 -> :sswitch_51
    .end sparse-switch
.end method

.method public b(IIFF)I
    .registers 7

    const/4 v0, -0x1

    if-ne p1, p2, :cond_46

    if-ne p2, v0, :cond_f

    .line 1
    iget-object p2, p0, Lb/f/c/g;->d:Landroid/util/SparseArray;

    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lb/f/c/g$a;

    goto :goto_19

    .line 2
    :cond_f
    iget-object p2, p0, Lb/f/c/g;->d:Landroid/util/SparseArray;

    iget v1, p0, Lb/f/c/g;->b:I

    invoke-virtual {p2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lb/f/c/g$a;

    :goto_19
    if-nez p2, :cond_1c

    return v0

    .line 3
    :cond_1c
    iget v1, p0, Lb/f/c/g;->c:I

    if-eq v1, v0, :cond_2f

    .line 4
    iget-object v1, p2, Lb/f/c/g$a;->b:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/c/g$b;

    invoke-virtual {v1, p3, p4}, Lb/f/c/g$b;->a(FF)Z

    move-result v1

    if-eqz v1, :cond_2f

    return p1

    .line 5
    :cond_2f
    invoke-virtual {p2, p3, p4}, Lb/f/c/g$a;->a(FF)I

    move-result p3

    if-ne p1, p3, :cond_36

    return p1

    :cond_36
    if-ne p3, v0, :cond_3b

    .line 6
    iget p1, p2, Lb/f/c/g$a;->c:I

    goto :goto_45

    :cond_3b
    iget-object p1, p2, Lb/f/c/g$a;->b:Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/c/g$b;

    iget p1, p1, Lb/f/c/g$b;->e:I

    :goto_45
    return p1

    .line 7
    :cond_46
    iget-object p1, p0, Lb/f/c/g;->d:Landroid/util/SparseArray;

    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/c/g$a;

    if-nez p1, :cond_51

    return v0

    .line 8
    :cond_51
    invoke-virtual {p1, p3, p4}, Lb/f/c/g$a;->a(FF)I

    move-result p2

    if-ne p2, v0, :cond_5a

    .line 9
    iget p1, p1, Lb/f/c/g$a;->c:I

    goto :goto_64

    :cond_5a
    iget-object p1, p1, Lb/f/c/g$a;->b:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/c/g$b;

    iget p1, p1, Lb/f/c/g$b;->e:I

    :goto_64
    return p1
.end method
