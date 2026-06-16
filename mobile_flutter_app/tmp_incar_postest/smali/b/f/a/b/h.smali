.class public Lb/f/a/b/h;
.super Ljava/lang/Object;
.source "KeyFrames.java"


# static fields
.field public static b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Constructor<",
            "+",
            "Lb/f/a/b/c;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Lb/f/a/b/c;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 5

    .line 1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lb/f/a/b/h;->b:Ljava/util/HashMap;

    :try_start_7
    const-string v1, "KeyAttribute"

    .line 2
    const-class v2, Lb/f/a/b/d;

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    sget-object v0, Lb/f/a/b/h;->b:Ljava/util/HashMap;

    const-string v1, "KeyPosition"

    const-class v2, Lb/f/a/b/i;

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    sget-object v0, Lb/f/a/b/h;->b:Ljava/util/HashMap;

    const-string v1, "KeyCycle"

    const-class v2, Lb/f/a/b/f;

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    sget-object v0, Lb/f/a/b/h;->b:Ljava/util/HashMap;

    const-string v1, "KeyTimeCycle"

    const-class v2, Lb/f/a/b/k;

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    sget-object v0, Lb/f/a/b/h;->b:Ljava/util/HashMap;

    const-string v1, "KeyTrigger"

    const-class v2, Lb/f/a/b/l;

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_51
    .catch Ljava/lang/NoSuchMethodException; {:try_start_7 .. :try_end_51} :catch_52

    goto :goto_5a

    :catch_52
    move-exception v0

    const-string v1, "KeyFrames"

    const-string v2, "unable to load"

    .line 7
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_5a
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/f/a/b/h;->a:Ljava/util/HashMap;

    const/4 v0, 0x0

    .line 3
    :try_start_b
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    :goto_f
    const/4 v2, 0x1

    if-eq v1, v2, :cond_7e

    const/4 v2, 0x2

    if-eq v1, v2, :cond_26

    const/4 v2, 0x3

    if-eq v1, v2, :cond_19

    goto :goto_70

    :cond_19
    const-string v1, "KeyFrameSet"

    .line 4
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_70

    return-void

    .line 5
    :cond_26
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 6
    sget-object v2, Lb/f/a/b/h;->b:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2
    :try_end_30
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_b .. :try_end_30} :catch_7a
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_30} :catch_75

    if-eqz v2, :cond_5d

    .line 7
    :try_start_32
    sget-object v2, Lb/f/a/b/h;->b:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Constructor;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/c;
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_43} :catch_50

    .line 8
    :try_start_43
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v0

    invoke-virtual {v1, p1, v0}, Lb/f/a/b/c;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, v1}, Lb/f/a/b/h;->a(Lb/f/a/b/c;)V
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_4d} :catch_4e

    goto :goto_5b

    :catch_4e
    move-exception v0

    goto :goto_54

    :catch_50
    move-exception v1

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    :goto_54
    :try_start_54
    const-string v2, "KeyFrames"

    const-string v3, "unable to create "

    .line 10
    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_5b
    move-object v0, v1

    goto :goto_70

    :cond_5d
    const-string v2, "CustomAttribute"

    .line 11
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_70

    if-eqz v0, :cond_70

    .line 12
    iget-object v1, v0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    if-eqz v1, :cond_70

    .line 13
    iget-object v1, v0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    invoke-static {p1, p2, v1}, Lb/f/c/a;->a(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;Ljava/util/HashMap;)V

    .line 14
    :cond_70
    :goto_70
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1
    :try_end_74
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_54 .. :try_end_74} :catch_7a
    .catch Ljava/io/IOException; {:try_start_54 .. :try_end_74} :catch_75

    goto :goto_f

    :catch_75
    move-exception p1

    .line 15
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_7e

    :catch_7a
    move-exception p1

    .line 16
    invoke-virtual {p1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    :cond_7e
    :goto_7e
    return-void
.end method


# virtual methods
.method public final a(Lb/f/a/b/c;)V
    .registers 5

    .line 1
    iget-object v0, p0, Lb/f/a/b/h;->a:Ljava/util/HashMap;

    iget v1, p1, Lb/f/a/b/c;->b:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 2
    iget-object v0, p0, Lb/f/a/b/h;->a:Ljava/util/HashMap;

    iget v1, p1, Lb/f/a/b/c;->b:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    :cond_1e
    iget-object v0, p0, Lb/f/a/b/h;->a:Ljava/util/HashMap;

    iget v1, p1, Lb/f/a/b/c;->b:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public a(Lb/f/a/b/n;)V
    .registers 5

    .line 4
    iget-object v0, p0, Lb/f/a/b/h;->a:Ljava/util/HashMap;

    iget v1, p1, Lb/f/a/b/n;->b:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_13

    .line 5
    invoke-virtual {p1, v0}, Lb/f/a/b/n;->a(Ljava/util/ArrayList;)V

    .line 6
    :cond_13
    iget-object v0, p0, Lb/f/a/b/h;->a:Ljava/util/HashMap;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_46

    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_26
    :goto_26
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_46

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/c;

    .line 8
    iget-object v2, p1, Lb/f/a/b/n;->a:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    iget-object v2, v2, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->U:Ljava/lang/String;

    .line 9
    invoke-virtual {v1, v2}, Lb/f/a/b/c;->a(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 10
    invoke-virtual {p1, v1}, Lb/f/a/b/n;->a(Lb/f/a/b/c;)V

    goto :goto_26

    :cond_46
    return-void
.end method
