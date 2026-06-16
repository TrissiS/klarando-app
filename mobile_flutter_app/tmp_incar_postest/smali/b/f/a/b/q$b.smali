.class public Lb/f/a/b/q$b;
.super Ljava/lang/Object;
.source "MotionScene.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/a/b/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/a/b/q$b$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:Z

.field public c:I

.field public d:I

.field public e:I

.field public f:Ljava/lang/String;

.field public g:I

.field public h:I

.field public i:F

.field public final j:Lb/f/a/b/q;

.field public k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/a/b/h;",
            ">;"
        }
    .end annotation
.end field

.field public l:Lb/f/a/b/t;

.field public m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/a/b/q$b$a;",
            ">;"
        }
    .end annotation
.end field

.field public n:I

.field public o:Z

.field public p:I

.field public q:I

.field public r:I


# direct methods
.method public constructor <init>(Lb/f/a/b/q;Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 8

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 29
    iput v0, p0, Lb/f/a/b/q$b;->a:I

    const/4 v1, 0x0

    .line 30
    iput-boolean v1, p0, Lb/f/a/b/q$b;->b:Z

    .line 31
    iput v0, p0, Lb/f/a/b/q$b;->c:I

    .line 32
    iput v0, p0, Lb/f/a/b/q$b;->d:I

    .line 33
    iput v1, p0, Lb/f/a/b/q$b;->e:I

    const/4 v2, 0x0

    .line 34
    iput-object v2, p0, Lb/f/a/b/q$b;->f:Ljava/lang/String;

    .line 35
    iput v0, p0, Lb/f/a/b/q$b;->g:I

    const/16 v3, 0x190

    .line 36
    iput v3, p0, Lb/f/a/b/q$b;->h:I

    const/4 v3, 0x0

    .line 37
    iput v3, p0, Lb/f/a/b/q$b;->i:F

    .line 38
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lb/f/a/b/q$b;->k:Ljava/util/ArrayList;

    .line 39
    iput-object v2, p0, Lb/f/a/b/q$b;->l:Lb/f/a/b/t;

    .line 40
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lb/f/a/b/q$b;->m:Ljava/util/ArrayList;

    .line 41
    iput v1, p0, Lb/f/a/b/q$b;->n:I

    .line 42
    iput-boolean v1, p0, Lb/f/a/b/q$b;->o:Z

    .line 43
    iput v0, p0, Lb/f/a/b/q$b;->p:I

    .line 44
    iput v1, p0, Lb/f/a/b/q$b;->q:I

    .line 45
    iput v1, p0, Lb/f/a/b/q$b;->r:I

    .line 46
    invoke-static {p1}, Lb/f/a/b/q;->d(Lb/f/a/b/q;)I

    move-result v0

    iput v0, p0, Lb/f/a/b/q$b;->h:I

    .line 47
    invoke-static {p1}, Lb/f/a/b/q;->a(Lb/f/a/b/q;)I

    move-result v0

    iput v0, p0, Lb/f/a/b/q$b;->q:I

    .line 48
    iput-object p1, p0, Lb/f/a/b/q$b;->j:Lb/f/a/b/q;

    .line 49
    invoke-static {p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q;Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Lb/f/a/b/q;Lb/f/a/b/q$b;)V
    .registers 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lb/f/a/b/q$b;->a:I

    const/4 v1, 0x0

    .line 3
    iput-boolean v1, p0, Lb/f/a/b/q$b;->b:Z

    .line 4
    iput v0, p0, Lb/f/a/b/q$b;->c:I

    .line 5
    iput v0, p0, Lb/f/a/b/q$b;->d:I

    .line 6
    iput v1, p0, Lb/f/a/b/q$b;->e:I

    const/4 v2, 0x0

    .line 7
    iput-object v2, p0, Lb/f/a/b/q$b;->f:Ljava/lang/String;

    .line 8
    iput v0, p0, Lb/f/a/b/q$b;->g:I

    const/16 v3, 0x190

    .line 9
    iput v3, p0, Lb/f/a/b/q$b;->h:I

    const/4 v3, 0x0

    .line 10
    iput v3, p0, Lb/f/a/b/q$b;->i:F

    .line 11
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lb/f/a/b/q$b;->k:Ljava/util/ArrayList;

    .line 12
    iput-object v2, p0, Lb/f/a/b/q$b;->l:Lb/f/a/b/t;

    .line 13
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lb/f/a/b/q$b;->m:Ljava/util/ArrayList;

    .line 14
    iput v1, p0, Lb/f/a/b/q$b;->n:I

    .line 15
    iput-boolean v1, p0, Lb/f/a/b/q$b;->o:Z

    .line 16
    iput v0, p0, Lb/f/a/b/q$b;->p:I

    .line 17
    iput v1, p0, Lb/f/a/b/q$b;->q:I

    .line 18
    iput v1, p0, Lb/f/a/b/q$b;->r:I

    .line 19
    iput-object p1, p0, Lb/f/a/b/q$b;->j:Lb/f/a/b/q;

    if-eqz p2, :cond_59

    .line 20
    iget p1, p2, Lb/f/a/b/q$b;->p:I

    iput p1, p0, Lb/f/a/b/q$b;->p:I

    .line 21
    iget p1, p2, Lb/f/a/b/q$b;->e:I

    iput p1, p0, Lb/f/a/b/q$b;->e:I

    .line 22
    iget-object p1, p2, Lb/f/a/b/q$b;->f:Ljava/lang/String;

    iput-object p1, p0, Lb/f/a/b/q$b;->f:Ljava/lang/String;

    .line 23
    iget p1, p2, Lb/f/a/b/q$b;->g:I

    iput p1, p0, Lb/f/a/b/q$b;->g:I

    .line 24
    iget p1, p2, Lb/f/a/b/q$b;->h:I

    iput p1, p0, Lb/f/a/b/q$b;->h:I

    .line 25
    iget-object p1, p2, Lb/f/a/b/q$b;->k:Ljava/util/ArrayList;

    iput-object p1, p0, Lb/f/a/b/q$b;->k:Ljava/util/ArrayList;

    .line 26
    iget p1, p2, Lb/f/a/b/q$b;->i:F

    iput p1, p0, Lb/f/a/b/q$b;->i:F

    .line 27
    iget p1, p2, Lb/f/a/b/q$b;->q:I

    iput p1, p0, Lb/f/a/b/q$b;->q:I

    :cond_59
    return-void
.end method

.method public static synthetic a(Lb/f/a/b/q$b;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/q$b;->c:I

    return p0
.end method

.method public static synthetic a(Lb/f/a/b/q$b;I)I
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/q$b;->c:I

    return p1
.end method

.method public static synthetic a(Lb/f/a/b/q$b;Lb/f/a/b/t;)Lb/f/a/b/t;
    .registers 2

    .line 3
    iput-object p1, p0, Lb/f/a/b/q$b;->l:Lb/f/a/b/t;

    return-object p1
.end method

.method public static synthetic b(Lb/f/a/b/q$b;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/q$b;->d:I

    return p0
.end method

.method public static synthetic b(Lb/f/a/b/q$b;I)I
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/q$b;->d:I

    return p1
.end method

.method public static synthetic c(Lb/f/a/b/q$b;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lb/f/a/b/q$b;->b:Z

    return p0
.end method

.method public static synthetic d(Lb/f/a/b/q$b;)Ljava/util/ArrayList;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/f/a/b/q$b;->k:Ljava/util/ArrayList;

    return-object p0
.end method

.method public static synthetic e(Lb/f/a/b/q$b;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/q$b;->e:I

    return p0
.end method

.method public static synthetic f(Lb/f/a/b/q$b;)Ljava/lang/String;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/f/a/b/q$b;->f:Ljava/lang/String;

    return-object p0
.end method

.method public static synthetic g(Lb/f/a/b/q$b;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/q$b;->g:I

    return p0
.end method

.method public static synthetic h(Lb/f/a/b/q$b;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/q$b;->h:I

    return p0
.end method

.method public static synthetic i(Lb/f/a/b/q$b;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/q$b;->p:I

    return p0
.end method

.method public static synthetic j(Lb/f/a/b/q$b;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/q$b;->i:F

    return p0
.end method

.method public static synthetic k(Lb/f/a/b/q$b;)Lb/f/a/b/t;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/f/a/b/q$b;->l:Lb/f/a/b/t;

    return-object p0
.end method

.method public static synthetic l(Lb/f/a/b/q$b;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/q$b;->a:I

    return p0
.end method

.method public static synthetic m(Lb/f/a/b/q$b;)Ljava/util/ArrayList;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/f/a/b/q$b;->m:Ljava/util/ArrayList;

    return-object p0
.end method

.method public static synthetic n(Lb/f/a/b/q$b;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lb/f/a/b/q$b;->o:Z

    return p0
.end method

.method public static synthetic o(Lb/f/a/b/q$b;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/q$b;->n:I

    return p0
.end method

.method public static synthetic p(Lb/f/a/b/q$b;)Lb/f/a/b/q;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/f/a/b/q$b;->j:Lb/f/a/b/q;

    return-object p0
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 5
    iget v0, p0, Lb/f/a/b/q$b;->h:I

    return v0
.end method

.method public a(Landroid/content/Context;)Ljava/lang/String;
    .registers 5

    .line 6
    iget v0, p0, Lb/f/a/b/q$b;->d:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_8

    const-string v0, "null"

    goto :goto_12

    .line 7
    :cond_8
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v2, p0, Lb/f/a/b/q$b;->d:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v0

    .line 8
    :goto_12
    iget v2, p0, Lb/f/a/b/q$b;->c:I

    if-ne v2, v1, :cond_28

    .line 9
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " -> null"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_46

    .line 10
    :cond_28
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " -> "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget v0, p0, Lb/f/a/b/q$b;->c:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_46
    return-object p1
.end method

.method public a(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 5

    .line 4
    iget-object v0, p0, Lb/f/a/b/q$b;->m:Ljava/util/ArrayList;

    new-instance v1, Lb/f/a/b/q$b$a;

    invoke-direct {v1, p1, p0, p2}, Lb/f/a/b/q$b$a;-><init>(Landroid/content/Context;Lb/f/a/b/q$b;Lorg/xmlpull/v1/XmlPullParser;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Lb/f/a/b/q;Landroid/content/Context;Landroid/content/res/TypedArray;)V
    .registers 12

    .line 15
    invoke-virtual {p3}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    const/4 v3, 0x1

    const/4 v4, -0x1

    if-ge v2, v0, :cond_118

    .line 16
    invoke-virtual {p3, v2}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v5

    .line 17
    sget v6, Lb/f/c/f;->Transition_constraintSetEnd:I

    const-string v7, "layout"

    if-ne v5, v6, :cond_41

    .line 18
    iget v3, p0, Lb/f/a/b/q$b;->c:I

    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/q$b;->c:I

    .line 19
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v4, p0, Lb/f/a/b/q$b;->c:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v3

    .line 20
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_114

    .line 21
    new-instance v3, Lb/f/c/c;

    invoke-direct {v3}, Lb/f/c/c;-><init>()V

    .line 22
    iget v4, p0, Lb/f/a/b/q$b;->c:I

    invoke-virtual {v3, p2, v4}, Lb/f/c/c;->b(Landroid/content/Context;I)V

    .line 23
    invoke-static {p1}, Lb/f/a/b/q;->b(Lb/f/a/b/q;)Landroid/util/SparseArray;

    move-result-object v4

    iget v5, p0, Lb/f/a/b/q$b;->c:I

    invoke-virtual {v4, v5, v3}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    goto/16 :goto_114

    .line 24
    :cond_41
    sget v6, Lb/f/c/f;->Transition_constraintSetStart:I

    if-ne v5, v6, :cond_72

    .line 25
    iget v3, p0, Lb/f/a/b/q$b;->d:I

    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/q$b;->d:I

    .line 26
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v4, p0, Lb/f/a/b/q$b;->d:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v3

    .line 27
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_114

    .line 28
    new-instance v3, Lb/f/c/c;

    invoke-direct {v3}, Lb/f/c/c;-><init>()V

    .line 29
    iget v4, p0, Lb/f/a/b/q$b;->d:I

    invoke-virtual {v3, p2, v4}, Lb/f/c/c;->b(Landroid/content/Context;I)V

    .line 30
    invoke-static {p1}, Lb/f/a/b/q;->b(Lb/f/a/b/q;)Landroid/util/SparseArray;

    move-result-object v4

    iget v5, p0, Lb/f/a/b/q$b;->d:I

    invoke-virtual {v4, v5, v3}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    goto/16 :goto_114

    .line 31
    :cond_72
    sget v6, Lb/f/c/f;->Transition_motionInterpolator:I

    if-ne v5, v6, :cond_b3

    .line 32
    invoke-virtual {p3, v5}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v6

    .line 33
    iget v6, v6, Landroid/util/TypedValue;->type:I

    const/4 v7, -0x2

    if-ne v6, v3, :cond_8b

    .line 34
    invoke-virtual {p3, v5, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/q$b;->g:I

    if-eq v3, v4, :cond_114

    .line 35
    iput v7, p0, Lb/f/a/b/q$b;->e:I

    goto/16 :goto_114

    :cond_8b
    const/4 v3, 0x3

    if-ne v6, v3, :cond_aa

    .line 36
    invoke-virtual {p3, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lb/f/a/b/q$b;->f:Ljava/lang/String;

    const-string v6, "/"

    .line 37
    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_a6

    .line 38
    invoke-virtual {p3, v5, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/q$b;->g:I

    .line 39
    iput v7, p0, Lb/f/a/b/q$b;->e:I

    goto/16 :goto_114

    .line 40
    :cond_a6
    iput v4, p0, Lb/f/a/b/q$b;->e:I

    goto/16 :goto_114

    .line 41
    :cond_aa
    iget v3, p0, Lb/f/a/b/q$b;->e:I

    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/q$b;->e:I

    goto :goto_114

    .line 42
    :cond_b3
    sget v3, Lb/f/c/f;->Transition_duration:I

    if-ne v5, v3, :cond_c0

    .line 43
    iget v3, p0, Lb/f/a/b/q$b;->h:I

    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/q$b;->h:I

    goto :goto_114

    .line 44
    :cond_c0
    sget v3, Lb/f/c/f;->Transition_staggered:I

    if-ne v5, v3, :cond_cd

    .line 45
    iget v3, p0, Lb/f/a/b/q$b;->i:F

    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    iput v3, p0, Lb/f/a/b/q$b;->i:F

    goto :goto_114

    .line 46
    :cond_cd
    sget v3, Lb/f/c/f;->Transition_autoTransition:I

    if-ne v5, v3, :cond_da

    .line 47
    iget v3, p0, Lb/f/a/b/q$b;->n:I

    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/q$b;->n:I

    goto :goto_114

    .line 48
    :cond_da
    sget v3, Lb/f/c/f;->Transition_android_id:I

    if-ne v5, v3, :cond_e7

    .line 49
    iget v3, p0, Lb/f/a/b/q$b;->a:I

    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/q$b;->a:I

    goto :goto_114

    .line 50
    :cond_e7
    sget v3, Lb/f/c/f;->Transition_transitionDisable:I

    if-ne v5, v3, :cond_f4

    .line 51
    iget-boolean v3, p0, Lb/f/a/b/q$b;->o:Z

    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    iput-boolean v3, p0, Lb/f/a/b/q$b;->o:Z

    goto :goto_114

    .line 52
    :cond_f4
    sget v3, Lb/f/c/f;->Transition_pathMotionArc:I

    if-ne v5, v3, :cond_ff

    .line 53
    invoke-virtual {p3, v5, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/q$b;->p:I

    goto :goto_114

    .line 54
    :cond_ff
    sget v3, Lb/f/c/f;->Transition_layoutDuringTransition:I

    if-ne v5, v3, :cond_10a

    .line 55
    invoke-virtual {p3, v5, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/q$b;->q:I

    goto :goto_114

    .line 56
    :cond_10a
    sget v3, Lb/f/c/f;->Transition_transitionFlags:I

    if-ne v5, v3, :cond_114

    .line 57
    invoke-virtual {p3, v5, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    iput v3, p0, Lb/f/a/b/q$b;->r:I

    :cond_114
    :goto_114
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_6

    .line 58
    :cond_118
    iget p1, p0, Lb/f/a/b/q$b;->d:I

    if-ne p1, v4, :cond_11e

    .line 59
    iput-boolean v3, p0, Lb/f/a/b/q$b;->b:Z

    :cond_11e
    return-void
.end method

.method public final a(Lb/f/a/b/q;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5

    .line 12
    sget-object v0, Lb/f/c/f;->Transition:[I

    invoke-virtual {p2, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p3

    .line 13
    invoke-virtual {p0, p1, p2, p3}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q;Landroid/content/Context;Landroid/content/res/TypedArray;)V

    .line 14
    invoke-virtual {p3}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public a(I)Z
    .registers 3

    .line 11
    iget v0, p0, Lb/f/a/b/q$b;->r:I

    and-int/2addr p1, v0

    if-eqz p1, :cond_7

    const/4 p1, 0x1

    goto :goto_8

    :cond_7
    const/4 p1, 0x0

    :goto_8
    return p1
.end method

.method public b()I
    .registers 2

    .line 3
    iget v0, p0, Lb/f/a/b/q$b;->c:I

    return v0
.end method

.method public b(I)V
    .registers 2

    .line 4
    iput p1, p0, Lb/f/a/b/q$b;->h:I

    return-void
.end method

.method public c()I
    .registers 2

    .line 2
    iget v0, p0, Lb/f/a/b/q$b;->q:I

    return v0
.end method

.method public d()I
    .registers 2

    .line 2
    iget v0, p0, Lb/f/a/b/q$b;->d:I

    return v0
.end method

.method public e()Lb/f/a/b/t;
    .registers 2

    .line 2
    iget-object v0, p0, Lb/f/a/b/q$b;->l:Lb/f/a/b/t;

    return-object v0
.end method

.method public f()Z
    .registers 2

    .line 2
    iget-boolean v0, p0, Lb/f/a/b/q$b;->o:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method
