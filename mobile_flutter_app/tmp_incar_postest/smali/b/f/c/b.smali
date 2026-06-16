.class public Lb/f/c/b;
.super Ljava/lang/Object;
.source "ConstraintLayoutStates.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/c/b$b;,
        Lb/f/c/b$a;
    }
.end annotation


# instance fields
.field public final a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lb/f/c/c;

.field public c:I

.field public d:I

.field public e:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lb/f/c/b$a;",
            ">;"
        }
    .end annotation
.end field

.field public f:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lb/f/c/c;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lb/f/c/d;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/constraintlayout/widget/ConstraintLayout;I)V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lb/f/c/b;->c:I

    .line 3
    iput v0, p0, Lb/f/c/b;->d:I

    .line 4
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lb/f/c/b;->e:Landroid/util/SparseArray;

    .line 5
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lb/f/c/b;->f:Landroid/util/SparseArray;

    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lb/f/c/b;->g:Lb/f/c/d;

    .line 7
    iput-object p2, p0, Lb/f/c/b;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    invoke-virtual {p0, p1, p3}, Lb/f/c/b;->a(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public a(IFF)V
    .registers 8

    .line 1
    iget v0, p0, Lb/f/c/b;->c:I

    const/4 v1, -0x1

    if-ne v0, p1, :cond_6c

    if-ne p1, v1, :cond_11

    .line 2
    iget-object p1, p0, Lb/f/c/b;->e:Landroid/util/SparseArray;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/c/b$a;

    goto :goto_19

    .line 3
    :cond_11
    iget-object p1, p0, Lb/f/c/b;->e:Landroid/util/SparseArray;

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/c/b$a;

    .line 4
    :goto_19
    iget v0, p0, Lb/f/c/b;->d:I

    if-eq v0, v1, :cond_2c

    .line 5
    iget-object v2, p1, Lb/f/c/b$a;->b:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/c/b$b;

    invoke-virtual {v0, p2, p3}, Lb/f/c/b$b;->a(FF)Z

    move-result v0

    if-eqz v0, :cond_2c

    return-void

    .line 6
    :cond_2c
    invoke-virtual {p1, p2, p3}, Lb/f/c/b$a;->a(FF)I

    move-result p2

    .line 7
    iget p3, p0, Lb/f/c/b;->d:I

    if-ne p3, p2, :cond_35

    return-void

    :cond_35
    if-ne p2, v1, :cond_3a

    .line 8
    iget-object p3, p0, Lb/f/c/b;->b:Lb/f/c/c;

    goto :goto_44

    :cond_3a
    iget-object p3, p1, Lb/f/c/b$a;->b:Ljava/util/ArrayList;

    .line 9
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lb/f/c/b$b;

    iget-object p3, p3, Lb/f/c/b$b;->f:Lb/f/c/c;

    :goto_44
    if-ne p2, v1, :cond_49

    .line 10
    iget p1, p1, Lb/f/c/b$a;->c:I

    goto :goto_53

    :cond_49
    iget-object p1, p1, Lb/f/c/b$a;->b:Ljava/util/ArrayList;

    .line 11
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/c/b$b;

    iget p1, p1, Lb/f/c/b$b;->e:I

    :goto_53
    if-nez p3, :cond_56

    return-void

    .line 12
    :cond_56
    iput p2, p0, Lb/f/c/b;->d:I

    .line 13
    iget-object p2, p0, Lb/f/c/b;->g:Lb/f/c/d;

    if-eqz p2, :cond_5f

    .line 14
    invoke-virtual {p2, v1, p1}, Lb/f/c/d;->b(II)V

    .line 15
    :cond_5f
    iget-object p2, p0, Lb/f/c/b;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p3, p2}, Lb/f/c/c;->b(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 16
    iget-object p2, p0, Lb/f/c/b;->g:Lb/f/c/d;

    if-eqz p2, :cond_d6

    .line 17
    invoke-virtual {p2, v1, p1}, Lb/f/c/d;->a(II)V

    goto :goto_d6

    .line 18
    :cond_6c
    iput p1, p0, Lb/f/c/b;->c:I

    .line 19
    iget-object v0, p0, Lb/f/c/b;->e:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/c/b$a;

    .line 20
    invoke-virtual {v0, p2, p3}, Lb/f/c/b$a;->a(FF)I

    move-result v2

    if-ne v2, v1, :cond_7f

    .line 21
    iget-object v3, v0, Lb/f/c/b$a;->d:Lb/f/c/c;

    goto :goto_89

    :cond_7f
    iget-object v3, v0, Lb/f/c/b$a;->b:Ljava/util/ArrayList;

    .line 22
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/c/b$b;

    iget-object v3, v3, Lb/f/c/b$b;->f:Lb/f/c/c;

    :goto_89
    if-ne v2, v1, :cond_8e

    .line 23
    iget v0, v0, Lb/f/c/b$a;->c:I

    goto :goto_98

    :cond_8e
    iget-object v0, v0, Lb/f/c/b$a;->b:Ljava/util/ArrayList;

    .line 24
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/c/b$b;

    iget v0, v0, Lb/f/c/b$b;->e:I

    :goto_98
    if-nez v3, :cond_c1

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NO Constraint set found ! id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", dim ="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ", "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ConstraintLayoutStates"

    invoke-static {p2, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 26
    :cond_c1
    iput v2, p0, Lb/f/c/b;->d:I

    .line 27
    iget-object p2, p0, Lb/f/c/b;->g:Lb/f/c/d;

    if-eqz p2, :cond_ca

    .line 28
    invoke-virtual {p2, p1, v0}, Lb/f/c/d;->b(II)V

    .line 29
    :cond_ca
    iget-object p2, p0, Lb/f/c/b;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v3, p2}, Lb/f/c/c;->b(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 30
    iget-object p2, p0, Lb/f/c/b;->g:Lb/f/c/d;

    if-eqz p2, :cond_d6

    .line 31
    invoke-virtual {p2, p1, v0}, Lb/f/c/d;->a(II)V

    :cond_d6
    :goto_d6
    return-void
.end method

.method public final a(Landroid/content/Context;I)V
    .registers 11

    .line 33
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 34
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object p2

    const/4 v0, 0x0

    .line 35
    :try_start_9
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    :goto_d
    const/4 v2, 0x1

    if-eq v1, v2, :cond_a6

    if-eqz v1, :cond_94

    const/4 v3, 0x2

    if-eq v1, v3, :cond_17

    goto/16 :goto_97

    .line 36
    :cond_17
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v4, -0x1

    .line 37
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v5

    const/4 v6, 0x4

    const/4 v7, 0x3

    sparse-switch v5, :sswitch_data_a8

    goto :goto_57

    :sswitch_26
    const-string v5, "Variant"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_57

    const/4 v4, 0x3

    goto :goto_57

    :sswitch_30
    const-string v5, "layoutDescription"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_57

    const/4 v4, 0x0

    goto :goto_57

    :sswitch_3a
    const-string v5, "StateSet"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_57

    const/4 v4, 0x1

    goto :goto_57

    :sswitch_44
    const-string v5, "State"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_57

    const/4 v4, 0x2

    goto :goto_57

    :sswitch_4e
    const-string v5, "ConstraintSet"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_57

    const/4 v4, 0x4

    :cond_57
    :goto_57
    if-eqz v4, :cond_97

    if-eq v4, v2, :cond_97

    if-eq v4, v3, :cond_87

    if-eq v4, v7, :cond_7c

    if-eq v4, v6, :cond_78

    const-string v2, "ConstraintLayoutStates"

    .line 38
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unknown tag "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_97

    .line 39
    :cond_78
    invoke-virtual {p0, p1, p2}, Lb/f/c/b;->a(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_97

    .line 40
    :cond_7c
    new-instance v1, Lb/f/c/b$b;

    invoke-direct {v1, p1, p2}, Lb/f/c/b$b;-><init>(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    if-eqz v0, :cond_97

    .line 41
    invoke-virtual {v0, v1}, Lb/f/c/b$a;->a(Lb/f/c/b$b;)V

    goto :goto_97

    .line 42
    :cond_87
    new-instance v0, Lb/f/c/b$a;

    invoke-direct {v0, p1, p2}, Lb/f/c/b$a;-><init>(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 43
    iget-object v1, p0, Lb/f/c/b;->e:Landroid/util/SparseArray;

    iget v2, v0, Lb/f/c/b$a;->a:I

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_97

    .line 44
    :cond_94
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 45
    :cond_97
    :goto_97
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1
    :try_end_9b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_9 .. :try_end_9b} :catch_a2
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9b} :catch_9d

    goto/16 :goto_d

    :catch_9d
    move-exception p1

    .line 46
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_a6

    :catch_a2
    move-exception p1

    .line 47
    invoke-virtual {p1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    :cond_a6
    :goto_a6
    return-void

    nop

    :sswitch_data_a8
    .sparse-switch
        -0x50764adb -> :sswitch_4e
        0x4c7d471 -> :sswitch_44
        0x526c4e31 -> :sswitch_3a
        0x62ce7272 -> :sswitch_30
        0x7155a865 -> :sswitch_26
    .end sparse-switch
.end method

.method public final a(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 11

    .line 48
    new-instance v0, Lb/f/c/c;

    invoke-direct {v0}, Lb/f/c/c;-><init>()V

    .line 49
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_a
    if-ge v2, v1, :cond_65

    .line 50
    invoke-interface {p2, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "id"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_62

    .line 51
    invoke-interface {p2, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "/"

    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, -0x1

    const/4 v5, 0x1

    if-eqz v2, :cond_3e

    const/16 v2, 0x2f

    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    add-int/2addr v2, v5

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 54
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v2, v4, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    goto :goto_3f

    :cond_3e
    const/4 v2, -0x1

    :goto_3f
    if-ne v2, v3, :cond_59

    if-eqz v1, :cond_52

    .line 55
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v5, :cond_52

    .line 56
    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    goto :goto_59

    :cond_52
    const-string v1, "ConstraintLayoutStates"

    const-string v3, "error in parsing id"

    .line 57
    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    :cond_59
    :goto_59
    invoke-virtual {v0, p1, p2}, Lb/f/c/c;->a(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 59
    iget-object p1, p0, Lb/f/c/b;->f:Landroid/util/SparseArray;

    invoke-virtual {p1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_65

    :cond_62
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :cond_65
    :goto_65
    return-void
.end method

.method public a(Lb/f/c/d;)V
    .registers 2

    .line 32
    iput-object p1, p0, Lb/f/c/b;->g:Lb/f/c/d;

    return-void
.end method
