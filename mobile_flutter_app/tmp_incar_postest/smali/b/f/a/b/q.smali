.class public Lb/f/a/b/q;
.super Ljava/lang/Object;
.source "MotionScene.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/a/b/q$b;
    }
.end annotation


# instance fields
.field public final a:Landroidx/constraintlayout/motion/widget/MotionLayout;

.field public b:Lb/f/c/g;

.field public c:Lb/f/a/b/q$b;

.field public d:Z

.field public e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/a/b/q$b;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lb/f/a/b/q$b;

.field public g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/a/b/q$b;",
            ">;"
        }
    .end annotation
.end field

.field public h:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lb/f/c/c;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public j:Landroid/util/SparseIntArray;

.field public k:Z

.field public l:I

.field public m:I

.field public n:Landroid/view/MotionEvent;

.field public o:Z

.field public p:Landroidx/constraintlayout/motion/widget/MotionLayout$f;

.field public q:Z

.field public r:F

.field public s:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/constraintlayout/motion/widget/MotionLayout;I)V
    .registers 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lb/f/a/b/q;->b:Lb/f/c/g;

    .line 3
    iput-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    const/4 v1, 0x0

    .line 4
    iput-boolean v1, p0, Lb/f/a/b/q;->d:Z

    .line 5
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lb/f/a/b/q;->e:Ljava/util/ArrayList;

    .line 6
    iput-object v0, p0, Lb/f/a/b/q;->f:Lb/f/a/b/q$b;

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/f/a/b/q;->g:Ljava/util/ArrayList;

    .line 8
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    .line 9
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/f/a/b/q;->i:Ljava/util/HashMap;

    .line 10
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lb/f/a/b/q;->j:Landroid/util/SparseIntArray;

    .line 11
    iput-boolean v1, p0, Lb/f/a/b/q;->k:Z

    const/16 v0, 0x190

    .line 12
    iput v0, p0, Lb/f/a/b/q;->l:I

    .line 13
    iput v1, p0, Lb/f/a/b/q;->m:I

    .line 14
    iput-boolean v1, p0, Lb/f/a/b/q;->o:Z

    .line 15
    iput-object p2, p0, Lb/f/a/b/q;->a:Landroidx/constraintlayout/motion/widget/MotionLayout;

    .line 16
    invoke-virtual {p0, p1, p3}, Lb/f/a/b/q;->a(Landroid/content/Context;I)V

    .line 17
    iget-object p1, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    sget p2, Lb/f/c/e;->motion_base:I

    new-instance p3, Lb/f/c/c;

    invoke-direct {p3}, Lb/f/c/c;-><init>()V

    invoke-virtual {p1, p2, p3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 18
    iget-object p1, p0, Lb/f/a/b/q;->i:Ljava/util/HashMap;

    sget p2, Lb/f/c/e;->motion_base:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const-string p3, "motion_base"

    invoke-virtual {p1, p3, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static synthetic a(Lb/f/a/b/q;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/q;->m:I

    return p0
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    if-nez p0, :cond_5

    const-string p0, ""

    return-object p0

    :cond_5
    const/16 v0, 0x2f

    .line 175
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_e

    return-object p0

    :cond_e
    add-int/lit8 v0, v0, 0x1

    .line 176
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lb/f/a/b/q;)Landroid/util/SparseArray;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    return-object p0
.end method

.method public static synthetic c(Lb/f/a/b/q;)Landroidx/constraintlayout/motion/widget/MotionLayout;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/f/a/b/q;->a:Landroidx/constraintlayout/motion/widget/MotionLayout;

    return-object p0
.end method

.method public static synthetic d(Lb/f/a/b/q;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/q;->l:I

    return p0
.end method


# virtual methods
.method public a(FF)F
    .registers 4

    .line 164
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_15

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 165
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lb/f/a/b/t;->b(FF)F

    move-result p1

    return p1

    :cond_15
    const/4 p1, 0x0

    return p1
.end method

.method public a()I
    .registers 2

    .line 166
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_9

    invoke-static {v0}, Lb/f/a/b/q$b;->i(Lb/f/a/b/q$b;)I

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, -0x1

    :goto_a
    return v0
.end method

.method public final a(Landroid/content/Context;Ljava/lang/String;)I
    .registers 8

    const-string v0, "/"

    .line 88
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-eqz v0, :cond_3e

    const/16 v0, 0x2f

    .line 89
    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    add-int/2addr v0, v2

    invoke-virtual {p2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 90
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    const-string v4, "id"

    invoke-virtual {v3, v0, v4, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    .line 91
    iget-boolean v0, p0, Lb/f/a/b/q;->k:Z

    if-eqz v0, :cond_3f

    .line 92
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "id getMap res = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_3f

    :cond_3e
    const/4 p1, -0x1

    :cond_3f
    :goto_3f
    if-ne p1, v1, :cond_59

    if-eqz p2, :cond_52

    .line 93
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v2, :cond_52

    .line 94
    invoke-virtual {p2, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    goto :goto_59

    :cond_52
    const-string p2, "MotionScene"

    const-string v0, "error in parsing id"

    .line 95
    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_59
    :goto_59
    return p1
.end method

.method public a(IFFLandroid/view/MotionEvent;)Lb/f/a/b/q$b;
    .registers 13

    const/4 v0, -0x1

    if-eq p1, v0, :cond_8c

    .line 40
    invoke-virtual {p0, p1}, Lb/f/a/b/q;->d(I)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 41
    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    .line 42
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_12
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/f/a/b/q$b;

    .line 43
    invoke-static {v4}, Lb/f/a/b/q$b;->n(Lb/f/a/b/q$b;)Z

    move-result v5

    if-eqz v5, :cond_25

    goto :goto_12

    .line 44
    :cond_25
    invoke-static {v4}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v5

    if-eqz v5, :cond_12

    .line 45
    invoke-static {v4}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v5

    iget-boolean v6, p0, Lb/f/a/b/q;->q:Z

    invoke-virtual {v5, v6}, Lb/f/a/b/t;->a(Z)V

    .line 46
    invoke-static {v4}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v5

    iget-object v6, p0, Lb/f/a/b/q;->a:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v5, v6, v3}, Lb/f/a/b/t;->b(Landroid/view/ViewGroup;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v5

    if-eqz v5, :cond_51

    if-eqz p4, :cond_51

    .line 47
    invoke-virtual {p4}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    invoke-virtual {p4}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    invoke-virtual {v5, v6, v7}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v5

    if-nez v5, :cond_51

    goto :goto_12

    .line 48
    :cond_51
    invoke-static {v4}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v5

    iget-object v6, p0, Lb/f/a/b/q;->a:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v5, v6, v3}, Lb/f/a/b/t;->b(Landroid/view/ViewGroup;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v5

    if-eqz v5, :cond_6e

    if-eqz p4, :cond_6e

    .line 49
    invoke-virtual {p4}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    invoke-virtual {p4}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    invoke-virtual {v5, v6, v7}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v5

    if-nez v5, :cond_6e

    goto :goto_12

    .line 50
    :cond_6e
    invoke-static {v4}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v5

    invoke-virtual {v5, p2, p3}, Lb/f/a/b/t;->a(FF)F

    move-result v5

    .line 51
    invoke-static {v4}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;)I

    move-result v6

    if-ne v6, p1, :cond_7f

    const/high16 v6, -0x40800000    # -1.0f

    goto :goto_82

    :cond_7f
    const v6, 0x3f8ccccd    # 1.1f

    :goto_82
    mul-float v5, v5, v6

    cmpl-float v6, v5, v1

    if-lez v6, :cond_12

    move-object v2, v4

    move v1, v5

    goto :goto_12

    :cond_8b
    return-object v2

    .line 52
    :cond_8c
    iget-object p1, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    return-object p1
.end method

.method public a(I)Lb/f/c/c;
    .registers 3

    const/4 v0, -0x1

    .line 112
    invoke-virtual {p0, p1, v0, v0}, Lb/f/a/b/q;->a(III)Lb/f/c/c;

    move-result-object p1

    return-object p1
.end method

.method public a(III)Lb/f/c/c;
    .registers 7

    .line 113
    iget-boolean v0, p0, Lb/f/a/b/q;->k:Z

    if-eqz v0, :cond_36

    .line 114
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 115
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "size "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 116
    :cond_36
    iget-object v0, p0, Lb/f/a/b/q;->b:Lb/f/c/g;

    if-eqz v0, :cond_42

    .line 117
    invoke-virtual {v0, p1, p2, p3}, Lb/f/c/g;->a(III)I

    move-result p2

    const/4 p3, -0x1

    if-eq p2, p3, :cond_42

    move p1, p2

    .line 118
    :cond_42
    iget-object p2, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    invoke-virtual {p2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_7d

    .line 119
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Warning could not find ConstraintSet id/"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lb/f/a/b/q;->a:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-static {p3, p1}, Lb/f/a/b/a;->a(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " In MotionScene"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "MotionScene"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    iget-object p1, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->keyAt(I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/c/c;

    return-object p1

    .line 121
    :cond_7d
    iget-object p2, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    invoke-virtual {p2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/c/c;

    return-object p1
.end method

.method public a(II)V
    .registers 9

    .line 2
    iget-object v0, p0, Lb/f/a/b/q;->b:Lb/f/c/g;

    const/4 v1, -0x1

    if-eqz v0, :cond_16

    .line 3
    invoke-virtual {v0, p1, v1, v1}, Lb/f/c/g;->a(III)I

    move-result v0

    if-eq v0, v1, :cond_c

    goto :goto_d

    :cond_c
    move v0, p1

    .line 4
    :goto_d
    iget-object v2, p0, Lb/f/a/b/q;->b:Lb/f/c/g;

    invoke-virtual {v2, p2, v1, v1}, Lb/f/c/g;->a(III)I

    move-result v2

    if-eq v2, v1, :cond_17

    goto :goto_18

    :cond_16
    move v0, p1

    :cond_17
    move v2, p2

    .line 5
    :goto_18
    iget-object v3, p0, Lb/f/a/b/q;->e:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_58

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/f/a/b/q$b;

    .line 6
    invoke-static {v4}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;)I

    move-result v5

    if-ne v5, v2, :cond_36

    .line 7
    invoke-static {v4}, Lb/f/a/b/q$b;->b(Lb/f/a/b/q$b;)I

    move-result v5

    if-eq v5, v0, :cond_42

    .line 8
    :cond_36
    invoke-static {v4}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;)I

    move-result v5

    if-ne v5, p2, :cond_1e

    .line 9
    invoke-static {v4}, Lb/f/a/b/q$b;->b(Lb/f/a/b/q$b;)I

    move-result v5

    if-ne v5, p1, :cond_1e

    .line 10
    :cond_42
    iput-object v4, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v4, :cond_57

    .line 11
    invoke-static {v4}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object p1

    if-eqz p1, :cond_57

    .line 12
    iget-object p1, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {p1}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object p1

    iget-boolean p2, p0, Lb/f/a/b/q;->q:Z

    invoke-virtual {p1, p2}, Lb/f/a/b/t;->a(Z)V

    :cond_57
    return-void

    .line 13
    :cond_58
    iget-object p1, p0, Lb/f/a/b/q;->f:Lb/f/a/b/q$b;

    .line 14
    iget-object v3, p0, Lb/f/a/b/q;->g:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_60
    :goto_60
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_74

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/f/a/b/q$b;

    .line 15
    invoke-static {v4}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;)I

    move-result v5

    if-ne v5, p2, :cond_60

    move-object p1, v4

    goto :goto_60

    .line 16
    :cond_74
    new-instance p2, Lb/f/a/b/q$b;

    invoke-direct {p2, p0, p1}, Lb/f/a/b/q$b;-><init>(Lb/f/a/b/q;Lb/f/a/b/q$b;)V

    .line 17
    invoke-static {p2, v0}, Lb/f/a/b/q$b;->b(Lb/f/a/b/q$b;I)I

    .line 18
    invoke-static {p2, v2}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;I)I

    if-eq v0, v1, :cond_86

    .line 19
    iget-object p1, p0, Lb/f/a/b/q;->e:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    :cond_86
    iput-object p2, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    return-void
.end method

.method public final a(Landroid/content/Context;I)V
    .registers 11

    .line 56
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 57
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v0

    const/4 v1, 0x0

    .line 58
    :try_start_9
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v2

    :goto_d
    const/4 v3, 0x1

    if-eq v2, v3, :cond_153

    if-eqz v2, :cond_141

    const/4 v4, 0x2

    if-eq v2, v4, :cond_17

    goto/16 :goto_144

    .line 59
    :cond_17
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 60
    iget-boolean v5, p0, Lb/f/a/b/q;->k:Z

    if-eqz v5, :cond_35

    .line 61
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "parsing = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 62
    :cond_35
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v5
    :try_end_39
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_9 .. :try_end_39} :catch_14f
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_39} :catch_14a

    const/4 v6, -0x1

    const-string v7, "MotionScene"

    sparse-switch v5, :sswitch_data_154

    goto :goto_83

    :sswitch_40
    :try_start_40
    const-string v3, "StateSet"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_83

    const/4 v3, 0x4

    goto :goto_84

    :sswitch_4a
    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_83

    const/4 v3, 0x0

    goto :goto_84

    :sswitch_52
    const-string v3, "OnSwipe"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_83

    const/4 v3, 0x2

    goto :goto_84

    :sswitch_5c
    const-string v3, "OnClick"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_83

    const/4 v3, 0x3

    goto :goto_84

    :sswitch_66
    const-string v4, "Transition"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_83

    goto :goto_84

    :sswitch_6f
    const-string v3, "KeyFrameSet"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_83

    const/4 v3, 0x6

    goto :goto_84

    :sswitch_79
    const-string v3, "ConstraintSet"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_83

    const/4 v3, 0x5

    goto :goto_84

    :cond_83
    :goto_83
    const/4 v3, -0x1

    :goto_84
    packed-switch v3, :pswitch_data_172

    goto/16 :goto_12c

    .line 63
    :pswitch_89
    new-instance v2, Lb/f/a/b/h;

    invoke-direct {v2, p1, v0}, Lb/f/a/b/h;-><init>(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 64
    invoke-static {v1}, Lb/f/a/b/q$b;->d(Lb/f/a/b/q$b;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_144

    .line 65
    :pswitch_97
    invoke-virtual {p0, p1, v0}, Lb/f/a/b/q;->a(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_144

    .line 66
    :pswitch_9c
    new-instance v2, Lb/f/c/g;

    invoke-direct {v2, p1, v0}, Lb/f/c/g;-><init>(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    iput-object v2, p0, Lb/f/a/b/q;->b:Lb/f/c/g;

    goto/16 :goto_144

    .line 67
    :pswitch_a5
    invoke-virtual {v1, p1, v0}, Lb/f/a/b/q$b;->a(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_144

    :pswitch_aa
    if-nez v1, :cond_d9

    .line 68
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, p2}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v2

    .line 69
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getLineNumber()I

    move-result v3

    .line 70
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " OnSwipe ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".xml:"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    :cond_d9
    new-instance v2, Lb/f/a/b/t;

    iget-object v3, p0, Lb/f/a/b/q;->a:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-direct {v2, p1, v3, v0}, Lb/f/a/b/t;-><init>(Landroid/content/Context;Landroidx/constraintlayout/motion/widget/MotionLayout;Lorg/xmlpull/v1/XmlPullParser;)V

    invoke-static {v1, v2}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;Lb/f/a/b/t;)Lb/f/a/b/t;

    goto :goto_144

    .line 72
    :pswitch_e4
    iget-object v1, p0, Lb/f/a/b/q;->e:Ljava/util/ArrayList;

    new-instance v2, Lb/f/a/b/q$b;

    invoke-direct {v2, p0, p1, v0}, Lb/f/a/b/q$b;-><init>(Lb/f/a/b/q;Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    iget-object v1, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-nez v1, :cond_10d

    invoke-static {v2}, Lb/f/a/b/q$b;->c(Lb/f/a/b/q$b;)Z

    move-result v1

    if-nez v1, :cond_10d

    .line 74
    iput-object v2, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v2, :cond_10d

    .line 75
    invoke-static {v2}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v1

    if-eqz v1, :cond_10d

    .line 76
    iget-object v1, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {v1}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v1

    iget-boolean v3, p0, Lb/f/a/b/q;->q:Z

    invoke-virtual {v1, v3}, Lb/f/a/b/t;->a(Z)V

    .line 77
    :cond_10d
    invoke-static {v2}, Lb/f/a/b/q$b;->c(Lb/f/a/b/q$b;)Z

    move-result v1

    if-eqz v1, :cond_126

    .line 78
    invoke-static {v2}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;)I

    move-result v1

    if-ne v1, v6, :cond_11c

    .line 79
    iput-object v2, p0, Lb/f/a/b/q;->f:Lb/f/a/b/q$b;

    goto :goto_121

    .line 80
    :cond_11c
    iget-object v1, p0, Lb/f/a/b/q;->g:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 81
    :goto_121
    iget-object v1, p0, Lb/f/a/b/q;->e:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_126
    move-object v1, v2

    goto :goto_144

    .line 82
    :pswitch_128
    invoke-virtual {p0, p1, v0}, Lb/f/a/b/q;->b(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_144

    .line 83
    :goto_12c
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "WARNING UNKNOWN ATTRIBUTE "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_144

    .line 84
    :cond_141
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 85
    :goto_144
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2
    :try_end_148
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_40 .. :try_end_148} :catch_14f
    .catch Ljava/io/IOException; {:try_start_40 .. :try_end_148} :catch_14a

    goto/16 :goto_d

    :catch_14a
    move-exception p1

    .line 86
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_153

    :catch_14f
    move-exception p1

    .line 87
    invoke-virtual {p1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    :cond_153
    :goto_153
    return-void

    :sswitch_data_154
    .sparse-switch
        -0x50764adb -> :sswitch_79
        -0x49df9cec -> :sswitch_6f
        0x100d4975 -> :sswitch_66
        0x12a432c9 -> :sswitch_5c
        0x138aac7b -> :sswitch_52
        0x2f487256 -> :sswitch_4a
        0x526c4e31 -> :sswitch_40
    .end sparse-switch

    :pswitch_data_172
    .packed-switch 0x0
        :pswitch_128
        :pswitch_e4
        :pswitch_aa
        :pswitch_a5
        :pswitch_9c
        :pswitch_97
        :pswitch_89
    .end packed-switch
.end method

.method public final a(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 16

    .line 96
    new-instance v0, Lb/f/c/c;

    invoke-direct {v0}, Lb/f/c/c;-><init>()V

    const/4 v1, 0x0

    .line 97
    invoke-virtual {v0, v1}, Lb/f/c/c;->a(Z)V

    .line 98
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v2

    const/4 v3, -0x1

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v6, -0x1

    :goto_11
    const/4 v7, 0x1

    if-ge v4, v2, :cond_77

    .line 99
    invoke-interface {p2, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v8

    .line 100
    invoke-interface {p2, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v9

    .line 101
    iget-boolean v10, p0, Lb/f/a/b/q;->k:Z

    if-eqz v10, :cond_36

    .line 102
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "id string = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 103
    :cond_36
    invoke-virtual {v8}, Ljava/lang/String;->hashCode()I

    move-result v10

    const v11, -0x59328327

    if-eq v10, v11, :cond_4e

    const/16 v11, 0xd1b

    if-eq v10, v11, :cond_44

    goto :goto_58

    :cond_44
    const-string v10, "id"

    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_58

    const/4 v8, 0x0

    goto :goto_59

    :cond_4e
    const-string v10, "deriveConstraintsFrom"

    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_58

    const/4 v8, 0x1

    goto :goto_59

    :cond_58
    :goto_58
    const/4 v8, -0x1

    :goto_59
    if-eqz v8, :cond_63

    if-eq v8, v7, :cond_5e

    goto :goto_74

    .line 104
    :cond_5e
    invoke-virtual {p0, p1, v9}, Lb/f/a/b/q;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    goto :goto_74

    .line 105
    :cond_63
    invoke-virtual {p0, p1, v9}, Lb/f/a/b/q;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    .line 106
    iget-object v7, p0, Lb/f/a/b/q;->i:Ljava/util/HashMap;

    invoke-static {v9}, Lb/f/a/b/q;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_74
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    :cond_77
    if-eq v5, v3, :cond_91

    .line 107
    iget-object v1, p0, Lb/f/a/b/q;->a:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget v1, v1, Landroidx/constraintlayout/motion/widget/MotionLayout;->T:I

    if-eqz v1, :cond_82

    .line 108
    invoke-virtual {v0, v7}, Lb/f/c/c;->b(Z)V

    .line 109
    :cond_82
    invoke-virtual {v0, p1, p2}, Lb/f/c/c;->a(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    if-eq v6, v3, :cond_8c

    .line 110
    iget-object p1, p0, Lb/f/a/b/q;->j:Landroid/util/SparseIntArray;

    invoke-virtual {p1, v5, v6}, Landroid/util/SparseIntArray;->put(II)V

    .line 111
    :cond_8c
    iget-object p1, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    invoke-virtual {p1, v5, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_91
    return-void
.end method

.method public a(Landroid/view/MotionEvent;ILandroidx/constraintlayout/motion/widget/MotionLayout;)V
    .registers 16

    .line 128
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 129
    iget-object v1, p0, Lb/f/a/b/q;->p:Landroidx/constraintlayout/motion/widget/MotionLayout$f;

    if-nez v1, :cond_11

    .line 130
    iget-object v1, p0, Lb/f/a/b/q;->a:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->k()Landroidx/constraintlayout/motion/widget/MotionLayout$f;

    move-result-object v1

    iput-object v1, p0, Lb/f/a/b/q;->p:Landroidx/constraintlayout/motion/widget/MotionLayout$f;

    .line 131
    :cond_11
    iget-object v1, p0, Lb/f/a/b/q;->p:Landroidx/constraintlayout/motion/widget/MotionLayout$f;

    invoke-interface {v1, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$f;->a(Landroid/view/MotionEvent;)V

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-eq p2, v2, :cond_ec

    .line 132
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_80

    const/4 v6, 0x2

    if-eq v4, v6, :cond_27

    goto/16 :goto_ec

    .line 133
    :cond_27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v4

    iget v6, p0, Lb/f/a/b/q;->s:F

    sub-float/2addr v4, v6

    .line 134
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    iget v7, p0, Lb/f/a/b/q;->r:F

    sub-float/2addr v6, v7

    float-to-double v7, v6

    const-wide/16 v9, 0x0

    cmpl-double v11, v7, v9

    if-nez v11, :cond_41

    float-to-double v7, v4

    cmpl-double v11, v7, v9

    if-eqz v11, :cond_45

    .line 135
    :cond_41
    iget-object v7, p0, Lb/f/a/b/q;->n:Landroid/view/MotionEvent;

    if-nez v7, :cond_46

    :cond_45
    return-void

    .line 136
    :cond_46
    invoke-virtual {p0, p2, v6, v4, v7}, Lb/f/a/b/q;->a(IFFLandroid/view/MotionEvent;)Lb/f/a/b/q$b;

    move-result-object v4

    if-eqz v4, :cond_ec

    .line 137
    invoke-virtual {p3, v4}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setTransition(Lb/f/a/b/q$b;)V

    .line 138
    iget-object v4, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {v4}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v4

    iget-object v6, p0, Lb/f/a/b/q;->a:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v4, v6, v0}, Lb/f/a/b/t;->b(Landroid/view/ViewGroup;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_70

    .line 139
    iget-object v4, p0, Lb/f/a/b/q;->n:Landroid/view/MotionEvent;

    .line 140
    invoke-virtual {v4}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    iget-object v6, p0, Lb/f/a/b/q;->n:Landroid/view/MotionEvent;

    invoke-virtual {v6}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    invoke-virtual {v0, v4, v6}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-nez v0, :cond_70

    const/4 v5, 0x1

    :cond_70
    iput-boolean v5, p0, Lb/f/a/b/q;->o:Z

    .line 141
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    iget v4, p0, Lb/f/a/b/q;->r:F

    iget v5, p0, Lb/f/a/b/q;->s:F

    invoke-virtual {v0, v4, v5}, Lb/f/a/b/t;->f(FF)V

    goto :goto_ec

    .line 142
    :cond_80
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result p2

    iput p2, p0, Lb/f/a/b/q;->r:F

    .line 143
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    iput p2, p0, Lb/f/a/b/q;->s:F

    .line 144
    iput-object p1, p0, Lb/f/a/b/q;->n:Landroid/view/MotionEvent;

    .line 145
    iget-object p1, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {p1}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object p1

    if-eqz p1, :cond_eb

    .line 146
    iget-object p1, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {p1}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object p1

    iget-object p2, p0, Lb/f/a/b/q;->a:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {p1, p2, v0}, Lb/f/a/b/t;->a(Landroid/view/ViewGroup;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object p1

    if-eqz p1, :cond_b9

    .line 147
    iget-object p2, p0, Lb/f/a/b/q;->n:Landroid/view/MotionEvent;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    iget-object p3, p0, Lb/f/a/b/q;->n:Landroid/view/MotionEvent;

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result p3

    invoke-virtual {p1, p2, p3}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    if-nez p1, :cond_b9

    .line 148
    iput-object v1, p0, Lb/f/a/b/q;->n:Landroid/view/MotionEvent;

    return-void

    .line 149
    :cond_b9
    iget-object p1, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {p1}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object p1

    iget-object p2, p0, Lb/f/a/b/q;->a:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {p1, p2, v0}, Lb/f/a/b/t;->b(Landroid/view/ViewGroup;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object p1

    if-eqz p1, :cond_dc

    .line 150
    iget-object p2, p0, Lb/f/a/b/q;->n:Landroid/view/MotionEvent;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    iget-object p3, p0, Lb/f/a/b/q;->n:Landroid/view/MotionEvent;

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result p3

    invoke-virtual {p1, p2, p3}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    if-nez p1, :cond_dc

    .line 151
    iput-boolean v3, p0, Lb/f/a/b/q;->o:Z

    goto :goto_de

    .line 152
    :cond_dc
    iput-boolean v5, p0, Lb/f/a/b/q;->o:Z

    .line 153
    :goto_de
    iget-object p1, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {p1}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object p1

    iget p2, p0, Lb/f/a/b/q;->r:F

    iget p3, p0, Lb/f/a/b/q;->s:F

    invoke-virtual {p1, p2, p3}, Lb/f/a/b/t;->e(FF)V

    :cond_eb
    return-void

    .line 154
    :cond_ec
    :goto_ec
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_105

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    if-eqz v0, :cond_105

    iget-boolean v0, p0, Lb/f/a/b/q;->o:Z

    if-nez v0, :cond_105

    .line 155
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    iget-object v4, p0, Lb/f/a/b/q;->p:Landroidx/constraintlayout/motion/widget/MotionLayout$f;

    invoke-virtual {v0, p1, v4, p2, p0}, Lb/f/a/b/t;->a(Landroid/view/MotionEvent;Landroidx/constraintlayout/motion/widget/MotionLayout$f;ILb/f/a/b/q;)V

    .line 156
    :cond_105
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result p2

    iput p2, p0, Lb/f/a/b/q;->r:F

    .line 157
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    iput p2, p0, Lb/f/a/b/q;->s:F

    .line 158
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-ne p1, v3, :cond_127

    .line 159
    iget-object p1, p0, Lb/f/a/b/q;->p:Landroidx/constraintlayout/motion/widget/MotionLayout$f;

    if-eqz p1, :cond_127

    .line 160
    invoke-interface {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$f;->c()V

    .line 161
    iput-object v1, p0, Lb/f/a/b/q;->p:Landroidx/constraintlayout/motion/widget/MotionLayout$f;

    .line 162
    iget p1, p3, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    if-eq p1, v2, :cond_127

    .line 163
    invoke-virtual {p0, p3, p1}, Lb/f/a/b/q;->b(Landroidx/constraintlayout/motion/widget/MotionLayout;I)Z

    :cond_127
    return-void
.end method

.method public a(Landroidx/constraintlayout/motion/widget/MotionLayout;)V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 167
    :goto_2
    iget-object v2, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_24

    .line 168
    iget-object v2, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    .line 169
    invoke-virtual {p0, v2}, Lb/f/a/b/q;->e(I)Z

    move-result v3

    if-eqz v3, :cond_1e

    const-string p1, "MotionScene"

    const-string v0, "Cannot be derived from yourself"

    .line 170
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 171
    :cond_1e
    invoke-virtual {p0, v2}, Lb/f/a/b/q;->f(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 172
    :cond_24
    :goto_24
    iget-object v1, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_3a

    .line 173
    iget-object v1, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/c/c;

    .line 174
    invoke-virtual {v1, p1}, Lb/f/c/c;->d(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_24

    :cond_3a
    return-void
.end method

.method public a(Landroidx/constraintlayout/motion/widget/MotionLayout;I)V
    .registers 7

    .line 24
    iget-object v0, p0, Lb/f/a/b/q;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/q$b;

    .line 25
    invoke-static {v1}, Lb/f/a/b/q$b;->m(Lb/f/a/b/q$b;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_6

    .line 26
    invoke-static {v1}, Lb/f/a/b/q$b;->m(Lb/f/a/b/q$b;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_24
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/a/b/q$b$a;

    .line 27
    invoke-virtual {v2, p1}, Lb/f/a/b/q$b$a;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    goto :goto_24

    .line 28
    :cond_34
    iget-object v0, p0, Lb/f/a/b/q;->g:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_68

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/q$b;

    .line 29
    invoke-static {v1}, Lb/f/a/b/q$b;->m(Lb/f/a/b/q$b;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_3a

    .line 30
    invoke-static {v1}, Lb/f/a/b/q$b;->m(Lb/f/a/b/q$b;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_58
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/a/b/q$b$a;

    .line 31
    invoke-virtual {v2, p1}, Lb/f/a/b/q$b$a;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    goto :goto_58

    .line 32
    :cond_68
    iget-object v0, p0, Lb/f/a/b/q;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/q$b;

    .line 33
    invoke-static {v1}, Lb/f/a/b/q$b;->m(Lb/f/a/b/q$b;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_6e

    .line 34
    invoke-static {v1}, Lb/f/a/b/q$b;->m(Lb/f/a/b/q$b;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_8c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/a/b/q$b$a;

    .line 35
    invoke-virtual {v3, p1, p2, v1}, Lb/f/a/b/q$b$a;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;ILb/f/a/b/q$b;)V

    goto :goto_8c

    .line 36
    :cond_9c
    iget-object v0, p0, Lb/f/a/b/q;->g:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/q$b;

    .line 37
    invoke-static {v1}, Lb/f/a/b/q$b;->m(Lb/f/a/b/q$b;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_a2

    .line 38
    invoke-static {v1}, Lb/f/a/b/q$b;->m(Lb/f/a/b/q$b;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_c0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/a/b/q$b$a;

    .line 39
    invoke-virtual {v3, p1, p2, v1}, Lb/f/a/b/q$b$a;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;ILb/f/a/b/q$b;)V

    goto :goto_c0

    :cond_d0
    return-void
.end method

.method public a(Lb/f/a/b/n;)V
    .registers 4

    .line 122
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-nez v0, :cond_21

    .line 123
    iget-object v0, p0, Lb/f/a/b/q;->f:Lb/f/a/b/q$b;

    if-eqz v0, :cond_20

    .line 124
    invoke-static {v0}, Lb/f/a/b/q$b;->d(Lb/f/a/b/q$b;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/h;

    .line 125
    invoke-virtual {v1, p1}, Lb/f/a/b/h;->a(Lb/f/a/b/n;)V

    goto :goto_10

    :cond_20
    return-void

    .line 126
    :cond_21
    invoke-static {v0}, Lb/f/a/b/q$b;->d(Lb/f/a/b/q$b;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/h;

    .line 127
    invoke-virtual {v1, p1}, Lb/f/a/b/h;->a(Lb/f/a/b/n;)V

    goto :goto_29

    :cond_39
    return-void
.end method

.method public a(Lb/f/a/b/q$b;)V
    .registers 3

    .line 21
    iput-object p1, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz p1, :cond_15

    .line 22
    invoke-static {p1}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object p1

    if-eqz p1, :cond_15

    .line 23
    iget-object p1, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {p1}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object p1

    iget-boolean v0, p0, Lb/f/a/b/q;->q:Z

    invoke-virtual {p1, v0}, Lb/f/a/b/t;->a(Z)V

    :cond_15
    return-void
.end method

.method public a(Z)V
    .registers 3

    .line 53
    iput-boolean p1, p0, Lb/f/a/b/q;->q:Z

    .line 54
    iget-object p1, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz p1, :cond_17

    invoke-static {p1}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object p1

    if-eqz p1, :cond_17

    .line 55
    iget-object p1, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {p1}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object p1

    iget-boolean v0, p0, Lb/f/a/b/q;->q:Z

    invoke-virtual {p1, v0}, Lb/f/a/b/t;->a(Z)V

    :cond_17
    return-void
.end method

.method public final b(I)I
    .registers 4

    .line 2
    iget-object v0, p0, Lb/f/a/b/q;->b:Lb/f/c/g;

    if-eqz v0, :cond_c

    const/4 v1, -0x1

    .line 3
    invoke-virtual {v0, p1, v1, v1}, Lb/f/c/g;->a(III)I

    move-result v0

    if-eq v0, v1, :cond_c

    return v0

    :cond_c
    return p1
.end method

.method public b(FF)V
    .registers 4

    .line 47
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_13

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 48
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lb/f/a/b/t;->c(FF)V

    :cond_13
    return-void
.end method

.method public final b(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 7

    .line 38
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object p2

    .line 39
    sget-object v0, Lb/f/c/f;->MotionScene:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 40
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_10
    if-ge v1, p2, :cond_30

    .line 41
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v2

    .line 42
    sget v3, Lb/f/c/f;->MotionScene_defaultDuration:I

    if-ne v2, v3, :cond_23

    .line 43
    iget v3, p0, Lb/f/a/b/q;->l:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lb/f/a/b/q;->l:I

    goto :goto_2d

    .line 44
    :cond_23
    sget v3, Lb/f/c/f;->MotionScene_layoutDuringTransition:I

    if-ne v2, v3, :cond_2d

    .line 45
    invoke-virtual {p1, v2, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v2

    iput v2, p0, Lb/f/a/b/q;->m:I

    :cond_2d
    :goto_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 46
    :cond_30
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public b(Landroidx/constraintlayout/motion/widget/MotionLayout;I)Z
    .registers 10

    .line 6
    invoke-virtual {p0}, Lb/f/a/b/q;->l()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return v1

    .line 7
    :cond_8
    iget-boolean v0, p0, Lb/f/a/b/q;->d:Z

    if-eqz v0, :cond_d

    return v1

    .line 8
    :cond_d
    iget-object v0, p0, Lb/f/a/b/q;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_13
    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/a/b/q$b;

    .line 9
    invoke-static {v2}, Lb/f/a/b/q$b;->o(Lb/f/a/b/q$b;)I

    move-result v3

    if-nez v3, :cond_26

    goto :goto_13

    .line 10
    :cond_26
    invoke-static {v2}, Lb/f/a/b/q$b;->b(Lb/f/a/b/q$b;)I

    move-result v3

    const/4 v4, 0x1

    if-ne p2, v3, :cond_6f

    .line 11
    invoke-static {v2}, Lb/f/a/b/q$b;->o(Lb/f/a/b/q$b;)I

    move-result v3

    const/4 v5, 0x4

    if-eq v3, v5, :cond_3b

    .line 12
    invoke-static {v2}, Lb/f/a/b/q$b;->o(Lb/f/a/b/q$b;)I

    move-result v3

    const/4 v6, 0x2

    if-ne v3, v6, :cond_6f

    .line 13
    :cond_3b
    sget-object p2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 14
    invoke-virtual {p1, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setTransition(Lb/f/a/b/q$b;)V

    .line 15
    invoke-static {v2}, Lb/f/a/b/q$b;->o(Lb/f/a/b/q$b;)I

    move-result p2

    if-ne p2, v5, :cond_57

    .line 16
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->p()V

    .line 17
    sget-object p2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->SETUP:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 18
    sget-object p2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->MOVING:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    goto :goto_6e

    :cond_57
    const/high16 p2, 0x3f800000    # 1.0f

    .line 19
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setProgress(F)V

    .line 20
    invoke-virtual {p1, v4}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(Z)V

    .line 21
    sget-object p2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->SETUP:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 22
    sget-object p2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->MOVING:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 23
    sget-object p2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    :goto_6e
    return v4

    .line 24
    :cond_6f
    invoke-static {v2}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;)I

    move-result v3

    if-ne p2, v3, :cond_13

    .line 25
    invoke-static {v2}, Lb/f/a/b/q$b;->o(Lb/f/a/b/q$b;)I

    move-result v3

    const/4 v5, 0x3

    if-eq v3, v5, :cond_82

    .line 26
    invoke-static {v2}, Lb/f/a/b/q$b;->o(Lb/f/a/b/q$b;)I

    move-result v3

    if-ne v3, v4, :cond_13

    .line 27
    :cond_82
    sget-object p2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 28
    invoke-virtual {p1, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setTransition(Lb/f/a/b/q$b;)V

    .line 29
    invoke-static {v2}, Lb/f/a/b/q$b;->o(Lb/f/a/b/q$b;)I

    move-result p2

    if-ne p2, v5, :cond_9e

    .line 30
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->q()V

    .line 31
    sget-object p2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->SETUP:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 32
    sget-object p2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->MOVING:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    goto :goto_b4

    :cond_9e
    const/4 p2, 0x0

    .line 33
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setProgress(F)V

    .line 34
    invoke-virtual {p1, v4}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(Z)V

    .line 35
    sget-object p2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->SETUP:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 36
    sget-object p2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->MOVING:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    .line 37
    sget-object p2, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setState(Landroidx/constraintlayout/motion/widget/MotionLayout$j;)V

    :goto_b4
    return v4

    :cond_b5
    return v1
.end method

.method public b()[I
    .registers 5

    .line 4
    iget-object v0, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_9
    if-ge v2, v0, :cond_16

    .line 5
    iget-object v3, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_16
    return-object v1
.end method

.method public c(I)Lb/f/a/b/q$b;
    .registers 5

    .line 3
    iget-object v0, p0, Lb/f/a/b/q;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/q$b;

    .line 4
    invoke-static {v1}, Lb/f/a/b/q$b;->l(Lb/f/a/b/q$b;)I

    move-result v2

    if-ne v2, p1, :cond_6

    return-object v1

    :cond_19
    const/4 p1, 0x0

    return-object p1
.end method

.method public c()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lb/f/a/b/q$b;",
            ">;"
        }
    .end annotation

    .line 2
    iget-object v0, p0, Lb/f/a/b/q;->e:Ljava/util/ArrayList;

    return-object v0
.end method

.method public c(FF)V
    .registers 4

    .line 5
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_13

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 6
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lb/f/a/b/t;->d(FF)V

    :cond_13
    return-void
.end method

.method public d()I
    .registers 2

    .line 7
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_9

    .line 8
    invoke-static {v0}, Lb/f/a/b/q$b;->h(Lb/f/a/b/q$b;)I

    move-result v0

    return v0

    .line 9
    :cond_9
    iget v0, p0, Lb/f/a/b/q;->l:I

    return v0
.end method

.method public d(I)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lb/f/a/b/q$b;",
            ">;"
        }
    .end annotation

    .line 2
    invoke-virtual {p0, p1}, Lb/f/a/b/q;->b(I)I

    move-result p1

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    iget-object v1, p0, Lb/f/a/b/q;->e:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_f
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/a/b/q$b;

    .line 5
    invoke-static {v2}, Lb/f/a/b/q$b;->b(Lb/f/a/b/q$b;)I

    move-result v3

    if-eq v3, p1, :cond_27

    invoke-static {v2}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;)I

    move-result v3

    if-ne v3, p1, :cond_f

    .line 6
    :cond_27
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_2b
    return-object v0
.end method

.method public e()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-nez v0, :cond_6

    const/4 v0, -0x1

    return v0

    .line 2
    :cond_6
    invoke-static {v0}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;)I

    move-result v0

    return v0
.end method

.method public final e(I)Z
    .registers 6

    .line 3
    iget-object v0, p0, Lb/f/a/b/q;->j:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    .line 4
    iget-object v1, p0, Lb/f/a/b/q;->j:Landroid/util/SparseIntArray;

    invoke-virtual {v1}, Landroid/util/SparseIntArray;->size()I

    move-result v1

    :goto_c
    if-lez v0, :cond_1f

    const/4 v2, 0x1

    if-ne v0, p1, :cond_12

    return v2

    :cond_12
    add-int/lit8 v3, v1, -0x1

    if-gez v1, :cond_17

    return v2

    .line 5
    :cond_17
    iget-object v1, p0, Lb/f/a/b/q;->j:Landroid/util/SparseIntArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    move v1, v3

    goto :goto_c

    :cond_1f
    const/4 p1, 0x0

    return p1
.end method

.method public f()Landroid/view/animation/Interpolator;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->e(Lb/f/a/b/q$b;)I

    move-result v0

    const/4 v1, -0x2

    if-eq v0, v1, :cond_4a

    const/4 v1, -0x1

    if-eq v0, v1, :cond_3a

    if-eqz v0, :cond_34

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2e

    const/4 v1, 0x2

    if-eq v0, v1, :cond_28

    const/4 v1, 0x4

    if-eq v0, v1, :cond_22

    const/4 v1, 0x5

    if-eq v0, v1, :cond_1c

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_1c
    new-instance v0, Landroid/view/animation/BounceInterpolator;

    invoke-direct {v0}, Landroid/view/animation/BounceInterpolator;-><init>()V

    return-object v0

    .line 3
    :cond_22
    new-instance v0, Landroid/view/animation/AnticipateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AnticipateInterpolator;-><init>()V

    return-object v0

    .line 4
    :cond_28
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    return-object v0

    .line 5
    :cond_2e
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    return-object v0

    .line 6
    :cond_34
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    return-object v0

    .line 7
    :cond_3a
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->f(Lb/f/a/b/q$b;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lb/f/a/a/c;->a(Ljava/lang/String;)Lb/f/a/a/c;

    move-result-object v0

    .line 8
    new-instance v1, Lb/f/a/b/q$a;

    invoke-direct {v1, p0, v0}, Lb/f/a/b/q$a;-><init>(Lb/f/a/b/q;Lb/f/a/a/c;)V

    return-object v1

    .line 9
    :cond_4a
    iget-object v0, p0, Lb/f/a/b/q;->a:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    .line 10
    invoke-static {v1}, Lb/f/a/b/q$b;->g(Lb/f/a/b/q$b;)I

    move-result v1

    .line 11
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v0

    return-object v0
.end method

.method public final f(I)V
    .registers 5

    .line 12
    iget-object v0, p0, Lb/f/a/b/q;->j:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    if-lez v0, :cond_4d

    .line 13
    iget-object v1, p0, Lb/f/a/b/q;->j:Landroid/util/SparseIntArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    invoke-virtual {p0, v1}, Lb/f/a/b/q;->f(I)V

    .line 14
    iget-object v1, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/c/c;

    .line 15
    iget-object v2, p0, Lb/f/a/b/q;->h:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/c/c;

    if-nez v2, :cond_44

    .line 16
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ERROR! invalid deriveConstraintsFrom: @id/"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/a/b/q;->a:Landroidx/constraintlayout/motion/widget/MotionLayout;

    .line 17
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lb/f/a/b/a;->a(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "MotionScene"

    .line 18
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 19
    :cond_44
    invoke-virtual {v1, v2}, Lb/f/c/c;->a(Lb/f/c/c;)V

    .line 20
    iget-object v0, p0, Lb/f/a/b/q;->j:Landroid/util/SparseIntArray;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseIntArray;->put(II)V

    :cond_4d
    return-void
.end method

.method public g()F
    .registers 2

    .line 4
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_15

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 5
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    invoke-virtual {v0}, Lb/f/a/b/t;->b()F

    move-result v0

    return v0

    :cond_15
    const/4 v0, 0x0

    return v0
.end method

.method public g(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0, p1}, Lb/f/a/b/q$b;->b(I)V

    goto :goto_a

    .line 3
    :cond_8
    iput p1, p0, Lb/f/a/b/q;->l:I

    :goto_a
    return-void
.end method

.method public h()F
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_15

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 2
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    invoke-virtual {v0}, Lb/f/a/b/t;->c()F

    move-result v0

    return v0

    :cond_15
    const/4 v0, 0x0

    return v0
.end method

.method public i()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_15

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 2
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    invoke-virtual {v0}, Lb/f/a/b/t;->d()Z

    move-result v0

    return v0

    :cond_15
    const/4 v0, 0x0

    return v0
.end method

.method public j()F
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_9

    .line 2
    invoke-static {v0}, Lb/f/a/b/q$b;->j(Lb/f/a/b/q$b;)F

    move-result v0

    return v0

    :cond_9
    const/4 v0, 0x0

    return v0
.end method

.method public k()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-nez v0, :cond_6

    const/4 v0, -0x1

    return v0

    .line 2
    :cond_6
    invoke-static {v0}, Lb/f/a/b/q$b;->b(Lb/f/a/b/q$b;)I

    move-result v0

    return v0
.end method

.method public final l()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/a/b/q;->p:Landroidx/constraintlayout/motion/widget/MotionLayout$f;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public m()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_13

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 2
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    invoke-virtual {v0}, Lb/f/a/b/t;->f()V

    :cond_13
    return-void
.end method

.method public n()Z
    .registers 4

    .line 1
    iget-object v0, p0, Lb/f/a/b/q;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/q$b;

    .line 2
    invoke-static {v1}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v1

    if-eqz v1, :cond_6

    return v2

    .line 3
    :cond_1a
    iget-object v0, p0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    if-eqz v0, :cond_25

    invoke-static {v0}, Lb/f/a/b/q$b;->k(Lb/f/a/b/q$b;)Lb/f/a/b/t;

    move-result-object v0

    if-eqz v0, :cond_25

    goto :goto_26

    :cond_25
    const/4 v2, 0x0

    :goto_26
    return v2
.end method
