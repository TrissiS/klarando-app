.class public Lb/t/a/a/i;
.super Lb/t/a/a/h;
.source "VectorDrawableCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/t/a/a/i$c;,
        Lb/t/a/a/i$b;,
        Lb/t/a/a/i$f;,
        Lb/t/a/a/i$d;,
        Lb/t/a/a/i$e;,
        Lb/t/a/a/i$g;,
        Lb/t/a/a/i$h;,
        Lb/t/a/a/i$i;
    }
.end annotation


# static fields
.field public static final q:Landroid/graphics/PorterDuff$Mode;


# instance fields
.field public i:Lb/t/a/a/i$h;

.field public j:Landroid/graphics/PorterDuffColorFilter;

.field public k:Landroid/graphics/ColorFilter;

.field public l:Z

.field public m:Z

.field public final n:[F

.field public final o:Landroid/graphics/Matrix;

.field public final p:Landroid/graphics/Rect;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    sput-object v0, Lb/t/a/a/i;->q:Landroid/graphics/PorterDuff$Mode;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/t/a/a/h;-><init>()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lb/t/a/a/i;->m:Z

    const/16 v0, 0x9

    new-array v0, v0, [F

    .line 3
    iput-object v0, p0, Lb/t/a/a/i;->n:[F

    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lb/t/a/a/i;->o:Landroid/graphics/Matrix;

    .line 5
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lb/t/a/a/i;->p:Landroid/graphics/Rect;

    .line 6
    new-instance v0, Lb/t/a/a/i$h;

    invoke-direct {v0}, Lb/t/a/a/i$h;-><init>()V

    iput-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    return-void
.end method

.method public constructor <init>(Lb/t/a/a/i$h;)V
    .registers 4

    .line 7
    invoke-direct {p0}, Lb/t/a/a/h;-><init>()V

    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lb/t/a/a/i;->m:Z

    const/16 v0, 0x9

    new-array v0, v0, [F

    .line 9
    iput-object v0, p0, Lb/t/a/a/i;->n:[F

    .line 10
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lb/t/a/a/i;->o:Landroid/graphics/Matrix;

    .line 11
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lb/t/a/a/i;->p:Landroid/graphics/Rect;

    .line 12
    iput-object p1, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    .line 13
    iget-object v0, p0, Lb/t/a/a/i;->j:Landroid/graphics/PorterDuffColorFilter;

    iget-object v1, p1, Lb/t/a/a/i$h;->c:Landroid/content/res/ColorStateList;

    iget-object p1, p1, Lb/t/a/a/i$h;->d:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0, v0, v1, p1}, Lb/t/a/a/i;->a(Landroid/graphics/PorterDuffColorFilter;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p1

    iput-object p1, p0, Lb/t/a/a/i;->j:Landroid/graphics/PorterDuffColorFilter;

    return-void
.end method

.method public static a(IF)I
    .registers 4

    .line 16
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    const v1, 0xffffff

    and-int/2addr p0, v1

    int-to-float v0, v0

    mul-float v0, v0, p1

    float-to-int p1, v0

    shl-int/lit8 p1, p1, 0x18

    or-int/2addr p0, p1

    return p0
.end method

.method public static a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;
    .registers 3

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1d

    const/4 v0, 0x5

    if-eq p0, v0, :cond_1a

    const/16 v0, 0x9

    if-eq p0, v0, :cond_17

    packed-switch p0, :pswitch_data_20

    return-object p1

    .line 17
    :pswitch_e
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->ADD:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 18
    :pswitch_11
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SCREEN:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 19
    :pswitch_14
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 20
    :cond_17
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 21
    :cond_1a
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 22
    :cond_1d
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    :pswitch_data_20
    .packed-switch 0xe
        :pswitch_14
        :pswitch_11
        :pswitch_e
    .end packed-switch
.end method

.method public static a(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Lb/t/a/a/i;
    .registers 9

    const-string v0, "parser error"

    const-string v1, "VectorDrawableCompat"

    .line 4
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x18

    if-lt v2, v3, :cond_21

    .line 5
    new-instance v0, Lb/t/a/a/i;

    invoke-direct {v0}, Lb/t/a/a/i;-><init>()V

    .line 6
    invoke-static {p0, p1, p2}, Lb/h/e/c/f;->a(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    iput-object p0, v0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    .line 7
    new-instance p0, Lb/t/a/a/i$i;

    iget-object p1, v0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    .line 8
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object p1

    invoke-direct {p0, p1}, Lb/t/a/a/i$i;-><init>(Landroid/graphics/drawable/Drawable$ConstantState;)V

    return-object v0

    .line 9
    :cond_21
    :try_start_21
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object p1

    .line 10
    invoke-static {p1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v2

    .line 11
    :goto_29
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    const/4 v4, 0x2

    if-eq v3, v4, :cond_34

    const/4 v5, 0x1

    if-eq v3, v5, :cond_34

    goto :goto_29

    :cond_34
    if-ne v3, v4, :cond_3b

    .line 12
    invoke-static {p0, p1, v2, p2}, Lb/t/a/a/i;->createFromXmlInner(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Lb/t/a/a/i;

    move-result-object p0

    return-object p0

    .line 13
    :cond_3b
    new-instance p0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string p1, "No start tag found"

    invoke-direct {p0, p1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_43
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_21 .. :try_end_43} :catch_48
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_43} :catch_43

    :catch_43
    move-exception p0

    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4c

    :catch_48
    move-exception p0

    .line 15
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_4c
    const/4 p0, 0x0

    return-object p0
.end method

.method public static createFromXmlInner(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Lb/t/a/a/i;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lb/t/a/a/i;

    invoke-direct {v0}, Lb/t/a/a/i;-><init>()V

    .line 2
    invoke-virtual {v0, p0, p1, p2, p3}, Lb/t/a/a/i;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    return-object v0
.end method


# virtual methods
.method public a(Landroid/graphics/PorterDuffColorFilter;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;
    .registers 5

    if-eqz p2, :cond_14

    if-nez p3, :cond_5

    goto :goto_14

    .line 2
    :cond_5
    invoke-virtual {p0}, Lb/t/a/a/h;->getState()[I

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    .line 3
    new-instance p2, Landroid/graphics/PorterDuffColorFilter;

    invoke-direct {p2, p1, p3}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    return-object p2

    :cond_14
    :goto_14
    const/4 p1, 0x0

    return-object p1
.end method

.method public a(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    iget-object v0, v0, Lb/t/a/a/i$h;->b:Lb/t/a/a/i$g;

    iget-object v0, v0, Lb/t/a/a/i$g;->p:Lb/e/a;

    invoke-virtual {v0, p1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final a(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    .line 47
    iget-object v1, v0, Lb/t/a/a/i$h;->b:Lb/t/a/a/i$g;

    .line 48
    new-instance v2, Ljava/util/ArrayDeque;

    invoke-direct {v2}, Ljava/util/ArrayDeque;-><init>()V

    .line 49
    iget-object v3, v1, Lb/t/a/a/i$g;->h:Lb/t/a/a/i$d;

    invoke-virtual {v2, v3}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 50
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    .line 51
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v4

    const/4 v5, 0x1

    add-int/2addr v4, v5

    const/4 v6, 0x1

    :goto_19
    if-eq v3, v5, :cond_ce

    .line 52
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v7

    const/4 v8, 0x3

    if-ge v7, v4, :cond_24

    if-eq v3, v8, :cond_ce

    :cond_24
    const/4 v7, 0x2

    const-string v9, "group"

    if-ne v3, v7, :cond_b9

    .line 53
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 54
    invoke-virtual {v2}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lb/t/a/a/i$d;

    const-string v8, "path"

    .line 55
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_60

    .line 56
    new-instance v3, Lb/t/a/a/i$c;

    invoke-direct {v3}, Lb/t/a/a/i$c;-><init>()V

    .line 57
    invoke-virtual {v3, p1, p3, p4, p2}, Lb/t/a/a/i$c;->a(Landroid/content/res/Resources;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 58
    iget-object v6, v7, Lb/t/a/a/i$d;->b:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    invoke-virtual {v3}, Lb/t/a/a/i$f;->getPathName()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_57

    .line 60
    iget-object v6, v1, Lb/t/a/a/i$g;->p:Lb/e/a;

    invoke-virtual {v3}, Lb/t/a/a/i$f;->getPathName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v3}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_57
    const/4 v6, 0x0

    .line 61
    iget v7, v0, Lb/t/a/a/i$h;->a:I

    iget v3, v3, Lb/t/a/a/i$f;->d:I

    or-int/2addr v3, v7

    iput v3, v0, Lb/t/a/a/i$h;->a:I

    goto :goto_c8

    :cond_60
    const-string v8, "clip-path"

    .line 62
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8c

    .line 63
    new-instance v3, Lb/t/a/a/i$b;

    invoke-direct {v3}, Lb/t/a/a/i$b;-><init>()V

    .line 64
    invoke-virtual {v3, p1, p3, p4, p2}, Lb/t/a/a/i$b;->a(Landroid/content/res/Resources;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 65
    iget-object v7, v7, Lb/t/a/a/i$d;->b:Ljava/util/ArrayList;

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    invoke-virtual {v3}, Lb/t/a/a/i$f;->getPathName()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_84

    .line 67
    iget-object v7, v1, Lb/t/a/a/i$g;->p:Lb/e/a;

    invoke-virtual {v3}, Lb/t/a/a/i$f;->getPathName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8, v3}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    :cond_84
    iget v7, v0, Lb/t/a/a/i$h;->a:I

    iget v3, v3, Lb/t/a/a/i$f;->d:I

    or-int/2addr v3, v7

    iput v3, v0, Lb/t/a/a/i$h;->a:I

    goto :goto_c8

    .line 69
    :cond_8c
    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c8

    .line 70
    new-instance v3, Lb/t/a/a/i$d;

    invoke-direct {v3}, Lb/t/a/a/i$d;-><init>()V

    .line 71
    invoke-virtual {v3, p1, p3, p4, p2}, Lb/t/a/a/i$d;->a(Landroid/content/res/Resources;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 72
    iget-object v7, v7, Lb/t/a/a/i$d;->b:Ljava/util/ArrayList;

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    invoke-virtual {v2, v3}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 74
    invoke-virtual {v3}, Lb/t/a/a/i$d;->getGroupName()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_b1

    .line 75
    iget-object v7, v1, Lb/t/a/a/i$g;->p:Lb/e/a;

    invoke-virtual {v3}, Lb/t/a/a/i$d;->getGroupName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8, v3}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    :cond_b1
    iget v7, v0, Lb/t/a/a/i$h;->a:I

    iget v3, v3, Lb/t/a/a/i$d;->k:I

    or-int/2addr v3, v7

    iput v3, v0, Lb/t/a/a/i$h;->a:I

    goto :goto_c8

    :cond_b9
    if-ne v3, v8, :cond_c8

    .line 77
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 78
    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c8

    .line 79
    invoke-virtual {v2}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 80
    :cond_c8
    :goto_c8
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    goto/16 :goto_19

    :cond_ce
    if-nez v6, :cond_d1

    return-void

    .line 81
    :cond_d1
    new-instance p1, Lorg/xmlpull/v1/XmlPullParserException;

    const-string p2, "no path defined"

    invoke-direct {p1, p2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .line 23
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    .line 24
    iget-object v1, v0, Lb/t/a/a/i$h;->b:Lb/t/a/a/i$g;

    const-string v2, "tintMode"

    const/4 v3, 0x6

    const/4 v4, -0x1

    .line 25
    invoke-static {p1, p2, v2, v3, v4}, Lb/h/e/c/g;->b(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v2

    .line 26
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v2, v3}, Lb/t/a/a/i;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v2

    iput-object v2, v0, Lb/t/a/a/i$h;->d:Landroid/graphics/PorterDuff$Mode;

    const-string v2, "tint"

    const/4 v3, 0x1

    .line 27
    invoke-static {p1, p2, p3, v2, v3}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;Ljava/lang/String;I)Landroid/content/res/ColorStateList;

    move-result-object p3

    if-eqz p3, :cond_1f

    .line 28
    iput-object p3, v0, Lb/t/a/a/i$h;->c:Landroid/content/res/ColorStateList;

    :cond_1f
    const/4 p3, 0x5

    .line 29
    iget-boolean v2, v0, Lb/t/a/a/i$h;->e:Z

    const-string v3, "autoMirrored"

    invoke-static {p1, p2, v3, p3, v2}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IZ)Z

    move-result p3

    iput-boolean p3, v0, Lb/t/a/a/i$h;->e:Z

    const/4 p3, 0x7

    .line 30
    iget v0, v1, Lb/t/a/a/i$g;->k:F

    const-string v2, "viewportWidth"

    invoke-static {p1, p2, v2, p3, v0}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result p3

    iput p3, v1, Lb/t/a/a/i$g;->k:F

    const/16 p3, 0x8

    .line 31
    iget v0, v1, Lb/t/a/a/i$g;->l:F

    const-string v2, "viewportHeight"

    invoke-static {p1, p2, v2, p3, v0}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result p3

    iput p3, v1, Lb/t/a/a/i$g;->l:F

    .line 32
    iget v0, v1, Lb/t/a/a/i$g;->k:F

    const/4 v2, 0x0

    cmpg-float v0, v0, v2

    if-lez v0, :cond_d6

    cmpg-float p3, p3, v2

    if-lez p3, :cond_bb

    const/4 p3, 0x3

    .line 33
    iget v0, v1, Lb/t/a/a/i$g;->i:F

    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    iput p3, v1, Lb/t/a/a/i$g;->i:F

    const/4 p3, 0x2

    .line 34
    iget v0, v1, Lb/t/a/a/i$g;->j:F

    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    iput p3, v1, Lb/t/a/a/i$g;->j:F

    .line 35
    iget v0, v1, Lb/t/a/a/i$g;->i:F

    cmpg-float v0, v0, v2

    if-lez v0, :cond_a0

    cmpg-float p3, p3, v2

    if-lez p3, :cond_85

    const/4 p3, 0x4

    .line 36
    invoke-virtual {v1}, Lb/t/a/a/i$g;->getAlpha()F

    move-result v0

    const-string v2, "alpha"

    .line 37
    invoke-static {p1, p2, v2, p3, v0}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result p2

    .line 38
    invoke-virtual {v1, p2}, Lb/t/a/a/i$g;->setAlpha(F)V

    const/4 p2, 0x0

    .line 39
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_84

    .line 40
    iput-object p1, v1, Lb/t/a/a/i$g;->n:Ljava/lang/String;

    .line 41
    iget-object p2, v1, Lb/t/a/a/i$g;->p:Lb/e/a;

    invoke-virtual {p2, p1, v1}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_84
    return-void

    .line 42
    :cond_85
    new-instance p2, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getPositionDescription()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "<vector> tag requires height > 0"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 43
    :cond_a0
    new-instance p2, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getPositionDescription()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "<vector> tag requires width > 0"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 44
    :cond_bb
    new-instance p2, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getPositionDescription()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "<vector> tag requires viewportHeight > 0"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 45
    :cond_d6
    new-instance p2, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getPositionDescription()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "<vector> tag requires viewportWidth > 0"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public a(Z)V
    .registers 2

    .line 82
    iput-boolean p1, p0, Lb/t/a/a/i;->m:Z

    return-void
.end method

.method public final a()Z
    .registers 4

    .line 83
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x11

    if-lt v0, v2, :cond_15

    .line 84
    invoke-virtual {p0}, Lb/t/a/a/i;->isAutoMirrored()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_15

    .line 85
    invoke-static {p0}, Lb/h/f/l/a;->e(Landroid/graphics/drawable/Drawable;)I

    move-result v0

    if-ne v0, v2, :cond_15

    const/4 v1, 0x1

    :cond_15
    return v1
.end method

.method public canApplyTheme()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_7

    .line 2
    invoke-static {v0}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;)Z

    :cond_7
    const/4 v0, 0x0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 11

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void

    .line 3
    :cond_8
    iget-object v0, p0, Lb/t/a/a/i;->p:Landroid/graphics/Rect;

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->copyBounds(Landroid/graphics/Rect;)V

    .line 4
    iget-object v0, p0, Lb/t/a/a/i;->p:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    if-lez v0, :cond_db

    iget-object v0, p0, Lb/t/a/a/i;->p:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    if-gtz v0, :cond_1f

    goto/16 :goto_db

    .line 5
    :cond_1f
    iget-object v0, p0, Lb/t/a/a/i;->k:Landroid/graphics/ColorFilter;

    if-nez v0, :cond_25

    iget-object v0, p0, Lb/t/a/a/i;->j:Landroid/graphics/PorterDuffColorFilter;

    .line 6
    :cond_25
    iget-object v1, p0, Lb/t/a/a/i;->o:Landroid/graphics/Matrix;

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->getMatrix(Landroid/graphics/Matrix;)V

    .line 7
    iget-object v1, p0, Lb/t/a/a/i;->o:Landroid/graphics/Matrix;

    iget-object v2, p0, Lb/t/a/a/i;->n:[F

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->getValues([F)V

    .line 8
    iget-object v1, p0, Lb/t/a/a/i;->n:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 9
    iget-object v3, p0, Lb/t/a/a/i;->n:[F

    const/4 v4, 0x4

    aget v3, v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    .line 10
    iget-object v4, p0, Lb/t/a/a/i;->n:[F

    const/4 v5, 0x1

    aget v4, v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    .line 11
    iget-object v5, p0, Lb/t/a/a/i;->n:[F

    const/4 v6, 0x3

    aget v5, v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    cmpl-float v4, v4, v7

    if-nez v4, :cond_60

    cmpl-float v4, v5, v7

    if-eqz v4, :cond_64

    :cond_60
    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    .line 12
    :cond_64
    iget-object v4, p0, Lb/t/a/a/i;->p:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    mul-float v4, v4, v1

    float-to-int v1, v4

    .line 13
    iget-object v4, p0, Lb/t/a/a/i;->p:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    mul-float v4, v4, v3

    float-to-int v3, v4

    const/16 v4, 0x800

    .line 14
    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 15
    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    if-lez v1, :cond_db

    if-gtz v3, :cond_87

    goto :goto_db

    .line 16
    :cond_87
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v4

    .line 17
    iget-object v5, p0, Lb/t/a/a/i;->p:Landroid/graphics/Rect;

    iget v8, v5, Landroid/graphics/Rect;->left:I

    int-to-float v8, v8

    iget v5, v5, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    invoke-virtual {p1, v8, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 18
    invoke-virtual {p0}, Lb/t/a/a/i;->a()Z

    move-result v5

    if-eqz v5, :cond_ab

    .line 19
    iget-object v5, p0, Lb/t/a/a/i;->p:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p1, v5, v7}, Landroid/graphics/Canvas;->translate(FF)V

    const/high16 v5, -0x40800000    # -1.0f

    .line 20
    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->scale(FF)V

    .line 21
    :cond_ab
    iget-object v5, p0, Lb/t/a/a/i;->p:Landroid/graphics/Rect;

    invoke-virtual {v5, v2, v2}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 22
    iget-object v2, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    invoke-virtual {v2, v1, v3}, Lb/t/a/a/i$h;->b(II)V

    .line 23
    iget-boolean v2, p0, Lb/t/a/a/i;->m:Z

    if-nez v2, :cond_bf

    .line 24
    iget-object v2, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    invoke-virtual {v2, v1, v3}, Lb/t/a/a/i$h;->c(II)V

    goto :goto_d1

    .line 25
    :cond_bf
    iget-object v2, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    invoke-virtual {v2}, Lb/t/a/a/i$h;->a()Z

    move-result v2

    if-nez v2, :cond_d1

    .line 26
    iget-object v2, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    invoke-virtual {v2, v1, v3}, Lb/t/a/a/i$h;->c(II)V

    .line 27
    iget-object v1, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    invoke-virtual {v1}, Lb/t/a/a/i$h;->d()V

    .line 28
    :cond_d1
    :goto_d1
    iget-object v1, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    iget-object v2, p0, Lb/t/a/a/i;->p:Landroid/graphics/Rect;

    invoke-virtual {v1, p1, v0, v2}, Lb/t/a/a/i$h;->a(Landroid/graphics/Canvas;Landroid/graphics/ColorFilter;Landroid/graphics/Rect;)V

    .line 29
    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_db
    :goto_db
    return-void
.end method

.method public getAlpha()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-static {v0}, Lb/h/f/l/a;->c(Landroid/graphics/drawable/Drawable;)I

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    iget-object v0, v0, Lb/t/a/a/i$h;->b:Lb/t/a/a/i$g;

    invoke-virtual {v0}, Lb/t/a/a/i$g;->getRootAlpha()I

    move-result v0

    return v0
.end method

.method public getChangingConfigurations()I
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result v0

    return v0

    .line 3
    :cond_9
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result v0

    iget-object v1, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    invoke-virtual {v1}, Lb/t/a/a/i$h;->getChangingConfigurations()I

    move-result v1

    or-int/2addr v0, v1

    return v0
.end method

.method public getColorFilter()Landroid/graphics/ColorFilter;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-static {v0}, Lb/h/f/l/a;->d(Landroid/graphics/drawable/Drawable;)Landroid/graphics/ColorFilter;

    move-result-object v0

    return-object v0

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/i;->k:Landroid/graphics/ColorFilter;

    return-object v0
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_16

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_16

    .line 2
    new-instance v0, Lb/t/a/a/i$i;

    iget-object v1, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/t/a/a/i$i;-><init>(Landroid/graphics/drawable/Drawable$ConstantState;)V

    return-object v0

    .line 3
    :cond_16
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    invoke-virtual {p0}, Lb/t/a/a/i;->getChangingConfigurations()I

    move-result v1

    iput v1, v0, Lb/t/a/a/i$h;->a:I

    .line 4
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    iget-object v0, v0, Lb/t/a/a/i$h;->b:Lb/t/a/a/i$g;

    iget v0, v0, Lb/t/a/a/i$g;->j:F

    float-to-int v0, v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    iget-object v0, v0, Lb/t/a/a/i$h;->b:Lb/t/a/a/i$g;

    iget v0, v0, Lb/t/a/a/i$g;->i:F

    float-to-int v0, v0

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v0

    return v0

    :cond_9
    const/4 v0, -0x3

    return v0
.end method

.method public inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;)V

    return-void

    :cond_8
    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, p1, p2, p3, v0}, Lb/t/a/a/i;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    return-void
.end method

.method public inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 4
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 5
    invoke-static {v0, p1, p2, p3, p4}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    return-void

    .line 6
    :cond_8
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    .line 7
    new-instance v1, Lb/t/a/a/i$g;

    invoke-direct {v1}, Lb/t/a/a/i$g;-><init>()V

    .line 8
    iput-object v1, v0, Lb/t/a/a/i$h;->b:Lb/t/a/a/i$g;

    .line 9
    sget-object v1, Lb/t/a/a/a;->a:[I

    invoke-static {p1, p4, p3, v1}, Lb/h/e/c/g;->a(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 10
    invoke-virtual {p0, v1, p2, p4}, Lb/t/a/a/i;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;)V

    .line 11
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 12
    invoke-virtual {p0}, Lb/t/a/a/i;->getChangingConfigurations()I

    move-result v1

    iput v1, v0, Lb/t/a/a/i$h;->a:I

    const/4 v1, 0x1

    .line 13
    iput-boolean v1, v0, Lb/t/a/a/i$h;->k:Z

    .line 14
    invoke-virtual {p0, p1, p2, p3, p4}, Lb/t/a/a/i;->a(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    .line 15
    iget-object p1, p0, Lb/t/a/a/i;->j:Landroid/graphics/PorterDuffColorFilter;

    iget-object p2, v0, Lb/t/a/a/i$h;->c:Landroid/content/res/ColorStateList;

    iget-object p3, v0, Lb/t/a/a/i$h;->d:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0, p1, p2, p3}, Lb/t/a/a/i;->a(Landroid/graphics/PorterDuffColorFilter;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p1

    iput-object p1, p0, Lb/t/a/a/i;->j:Landroid/graphics/PorterDuffColorFilter;

    return-void
.end method

.method public invalidateSelf()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    .line 3
    :cond_8
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public isAutoMirrored()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-static {v0}, Lb/h/f/l/a;->f(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    iget-boolean v0, v0, Lb/t/a/a/i$h;->e:Z

    return v0
.end method

.method public isStateful()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    return v0

    .line 3
    :cond_9
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-nez v0, :cond_28

    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    if-eqz v0, :cond_26

    .line 4
    invoke-virtual {v0}, Lb/t/a/a/i$h;->c()Z

    move-result v0

    if-nez v0, :cond_28

    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    iget-object v0, v0, Lb/t/a/a/i$h;->c:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_26

    .line 5
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_26

    goto :goto_28

    :cond_26
    const/4 v0, 0x0

    goto :goto_29

    :cond_28
    :goto_28
    const/4 v0, 0x1

    :goto_29
    return v0
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    return-object p0

    .line 3
    :cond_8
    iget-boolean v0, p0, Lb/t/a/a/i;->l:Z

    if-nez v0, :cond_1e

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-ne v0, p0, :cond_1e

    .line 4
    new-instance v0, Lb/t/a/a/i$h;

    iget-object v1, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    invoke-direct {v0, v1}, Lb/t/a/a/i$h;-><init>(Lb/t/a/a/i$h;)V

    iput-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lb/t/a/a/i;->l:Z

    :cond_1e
    return-object p0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    :cond_7
    return-void
.end method

.method public onStateChange([I)Z
    .registers 7

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result p1

    return p1

    :cond_9
    const/4 v0, 0x0

    .line 3
    iget-object v1, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    .line 4
    iget-object v2, v1, Lb/t/a/a/i$h;->c:Landroid/content/res/ColorStateList;

    const/4 v3, 0x1

    if-eqz v2, :cond_21

    iget-object v4, v1, Lb/t/a/a/i$h;->d:Landroid/graphics/PorterDuff$Mode;

    if-eqz v4, :cond_21

    .line 5
    iget-object v0, p0, Lb/t/a/a/i;->j:Landroid/graphics/PorterDuffColorFilter;

    invoke-virtual {p0, v0, v2, v4}, Lb/t/a/a/i;->a(Landroid/graphics/PorterDuffColorFilter;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v0

    iput-object v0, p0, Lb/t/a/a/i;->j:Landroid/graphics/PorterDuffColorFilter;

    .line 6
    invoke-virtual {p0}, Lb/t/a/a/i;->invalidateSelf()V

    const/4 v0, 0x1

    .line 7
    :cond_21
    invoke-virtual {v1}, Lb/t/a/a/i$h;->c()Z

    move-result v2

    if-eqz v2, :cond_31

    invoke-virtual {v1, p1}, Lb/t/a/a/i$h;->a([I)Z

    move-result p1

    if-eqz p1, :cond_31

    .line 8
    invoke-virtual {p0}, Lb/t/a/a/i;->invalidateSelf()V

    goto :goto_32

    :cond_31
    move v3, v0

    :goto_32
    return v3
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .registers 5

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    return-void

    .line 3
    :cond_8
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public setAlpha(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    return-void

    .line 3
    :cond_8
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    iget-object v0, v0, Lb/t/a/a/i$h;->b:Lb/t/a/a/i$g;

    invoke-virtual {v0}, Lb/t/a/a/i$g;->getRootAlpha()I

    move-result v0

    if-eq v0, p1, :cond_1c

    .line 4
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    iget-object v0, v0, Lb/t/a/a/i$h;->b:Lb/t/a/a/i$g;

    invoke-virtual {v0, p1}, Lb/t/a/a/i$g;->setRootAlpha(I)V

    .line 5
    invoke-virtual {p0}, Lb/t/a/a/i;->invalidateSelf()V

    :cond_1c
    return-void
.end method

.method public setAutoMirrored(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Z)V

    return-void

    .line 3
    :cond_8
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    iput-boolean p1, v0, Lb/t/a/a/i$h;->e:Z

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void

    .line 3
    :cond_8
    iput-object p1, p0, Lb/t/a/a/i;->k:Landroid/graphics/ColorFilter;

    .line 4
    invoke-virtual {p0}, Lb/t/a/a/i;->invalidateSelf()V

    return-void
.end method

.method public setTint(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-static {v0, p1}, Lb/h/f/l/a;->b(Landroid/graphics/drawable/Drawable;I)V

    return-void

    .line 3
    :cond_8
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb/t/a/a/i;->setTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    return-void

    .line 3
    :cond_8
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    .line 4
    iget-object v1, v0, Lb/t/a/a/i$h;->c:Landroid/content/res/ColorStateList;

    if-eq v1, p1, :cond_1d

    .line 5
    iput-object p1, v0, Lb/t/a/a/i$h;->c:Landroid/content/res/ColorStateList;

    .line 6
    iget-object v1, p0, Lb/t/a/a/i;->j:Landroid/graphics/PorterDuffColorFilter;

    iget-object v0, v0, Lb/t/a/a/i$h;->d:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0, v1, p1, v0}, Lb/t/a/a/i;->a(Landroid/graphics/PorterDuffColorFilter;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p1

    iput-object p1, p0, Lb/t/a/a/i;->j:Landroid/graphics/PorterDuffColorFilter;

    .line 7
    invoke-virtual {p0}, Lb/t/a/a/i;->invalidateSelf()V

    :cond_1d
    return-void
.end method

.method public setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    return-void

    .line 3
    :cond_8
    iget-object v0, p0, Lb/t/a/a/i;->i:Lb/t/a/a/i$h;

    .line 4
    iget-object v1, v0, Lb/t/a/a/i$h;->d:Landroid/graphics/PorterDuff$Mode;

    if-eq v1, p1, :cond_1d

    .line 5
    iput-object p1, v0, Lb/t/a/a/i$h;->d:Landroid/graphics/PorterDuff$Mode;

    .line 6
    iget-object v1, p0, Lb/t/a/a/i;->j:Landroid/graphics/PorterDuffColorFilter;

    iget-object v0, v0, Lb/t/a/a/i$h;->c:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v1, v0, p1}, Lb/t/a/a/i;->a(Landroid/graphics/PorterDuffColorFilter;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p1

    iput-object p1, p0, Lb/t/a/a/i;->j:Landroid/graphics/PorterDuffColorFilter;

    .line 7
    invoke-virtual {p0}, Lb/t/a/a/i;->invalidateSelf()V

    :cond_1d
    return-void
.end method

.method public setVisible(ZZ)Z
    .registers 4

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result p1

    return p1

    .line 3
    :cond_9
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result p1

    return p1
.end method

.method public unscheduleSelf(Ljava/lang/Runnable;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    return-void

    .line 3
    :cond_8
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    return-void
.end method
