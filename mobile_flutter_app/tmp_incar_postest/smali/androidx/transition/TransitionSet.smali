.class public Landroidx/transition/TransitionSet;
.super Landroidx/transition/Transition;
.source "TransitionSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/transition/TransitionSet$b;
    }
.end annotation


# instance fields
.field public Q:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/transition/Transition;",
            ">;"
        }
    .end annotation
.end field

.field public R:Z

.field public S:I

.field public T:Z

.field public U:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroidx/transition/Transition;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Landroidx/transition/TransitionSet;->R:Z

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Landroidx/transition/TransitionSet;->T:Z

    .line 5
    iput v0, p0, Landroidx/transition/TransitionSet;->U:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 6
    invoke-direct {p0, p1, p2}, Landroidx/transition/Transition;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Landroidx/transition/TransitionSet;->R:Z

    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Landroidx/transition/TransitionSet;->T:Z

    .line 10
    iput v0, p0, Landroidx/transition/TransitionSet;->U:I

    .line 11
    sget-object v1, Lb/s/t;->g:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 12
    check-cast p2, Landroid/content/res/XmlResourceParser;

    const-string v1, "transitionOrdering"

    invoke-static {p1, p2, v1, v0, v0}, Lb/h/e/c/g;->b(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result p2

    .line 13
    invoke-virtual {p0, p2}, Landroidx/transition/TransitionSet;->c(I)Landroidx/transition/TransitionSet;

    .line 14
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public bridge synthetic a(J)Landroidx/transition/Transition;
    .registers 3

    .line 3
    invoke-virtual {p0, p1, p2}, Landroidx/transition/TransitionSet;->a(J)Landroidx/transition/TransitionSet;

    return-object p0
.end method

.method public bridge synthetic a(Landroid/animation/TimeInterpolator;)Landroidx/transition/Transition;
    .registers 2

    .line 4
    invoke-virtual {p0, p1}, Landroidx/transition/TransitionSet;->a(Landroid/animation/TimeInterpolator;)Landroidx/transition/TransitionSet;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic a(Landroid/view/View;)Landroidx/transition/Transition;
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Landroidx/transition/TransitionSet;->a(Landroid/view/View;)Landroidx/transition/TransitionSet;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic a(Landroidx/transition/Transition$f;)Landroidx/transition/Transition;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Landroidx/transition/TransitionSet;->a(Landroidx/transition/Transition$f;)Landroidx/transition/TransitionSet;

    move-result-object p1

    return-object p1
.end method

.method public a(J)Landroidx/transition/TransitionSet;
    .registers 8

    .line 16
    invoke-super {p0, p1, p2}, Landroidx/transition/Transition;->a(J)Landroidx/transition/Transition;

    .line 17
    iget-wide v0, p0, Landroidx/transition/Transition;->j:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-ltz v4, :cond_24

    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    if-eqz v0, :cond_24

    .line 18
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_14
    if-ge v1, v0, :cond_24

    .line 19
    iget-object v2, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/transition/Transition;

    invoke-virtual {v2, p1, p2}, Landroidx/transition/Transition;->a(J)Landroidx/transition/Transition;

    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    :cond_24
    return-object p0
.end method

.method public a(Landroid/animation/TimeInterpolator;)Landroidx/transition/TransitionSet;
    .registers 5

    .line 20
    iget v0, p0, Landroidx/transition/TransitionSet;->U:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroidx/transition/TransitionSet;->U:I

    .line 21
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    if-eqz v0, :cond_1f

    .line 22
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_f
    if-ge v1, v0, :cond_1f

    .line 23
    iget-object v2, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/transition/Transition;

    invoke-virtual {v2, p1}, Landroidx/transition/Transition;->a(Landroid/animation/TimeInterpolator;)Landroidx/transition/Transition;

    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 24
    :cond_1f
    invoke-super {p0, p1}, Landroidx/transition/Transition;->a(Landroid/animation/TimeInterpolator;)Landroidx/transition/Transition;

    move-object p1, p0

    check-cast p1, Landroidx/transition/TransitionSet;

    return-object p1
.end method

.method public a(Landroid/view/View;)Landroidx/transition/TransitionSet;
    .registers 4

    const/4 v0, 0x0

    .line 25
    :goto_1
    iget-object v1, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_17

    .line 26
    iget-object v1, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/transition/Transition;

    invoke-virtual {v1, p1}, Landroidx/transition/Transition;->a(Landroid/view/View;)Landroidx/transition/Transition;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 27
    :cond_17
    invoke-super {p0, p1}, Landroidx/transition/Transition;->a(Landroid/view/View;)Landroidx/transition/Transition;

    move-object p1, p0

    check-cast p1, Landroidx/transition/TransitionSet;

    return-object p1
.end method

.method public a(Landroidx/transition/Transition$f;)Landroidx/transition/TransitionSet;
    .registers 2

    .line 28
    invoke-super {p0, p1}, Landroidx/transition/Transition;->a(Landroidx/transition/Transition$f;)Landroidx/transition/Transition;

    move-object p1, p0

    check-cast p1, Landroidx/transition/TransitionSet;

    return-object p1
.end method

.method public a(Landroidx/transition/Transition;)Landroidx/transition/TransitionSet;
    .registers 7

    .line 5
    invoke-virtual {p0, p1}, Landroidx/transition/TransitionSet;->b(Landroidx/transition/Transition;)V

    .line 6
    iget-wide v0, p0, Landroidx/transition/Transition;->j:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-ltz v4, :cond_e

    .line 7
    invoke-virtual {p1, v0, v1}, Landroidx/transition/Transition;->a(J)Landroidx/transition/Transition;

    .line 8
    :cond_e
    iget v0, p0, Landroidx/transition/TransitionSet;->U:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1b

    .line 9
    invoke-virtual {p0}, Landroidx/transition/Transition;->f()Landroid/animation/TimeInterpolator;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/transition/Transition;->a(Landroid/animation/TimeInterpolator;)Landroidx/transition/Transition;

    .line 10
    :cond_1b
    iget v0, p0, Landroidx/transition/TransitionSet;->U:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_28

    .line 11
    invoke-virtual {p0}, Landroidx/transition/Transition;->i()Lb/s/w;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/transition/Transition;->a(Lb/s/w;)V

    .line 12
    :cond_28
    iget v0, p0, Landroidx/transition/TransitionSet;->U:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_35

    .line 13
    invoke-virtual {p0}, Landroidx/transition/Transition;->h()Landroidx/transition/PathMotion;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/transition/Transition;->a(Landroidx/transition/PathMotion;)V

    .line 14
    :cond_35
    iget v0, p0, Landroidx/transition/TransitionSet;->U:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_42

    .line 15
    invoke-virtual {p0}, Landroidx/transition/Transition;->e()Landroidx/transition/Transition$e;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/transition/Transition;->a(Landroidx/transition/Transition$e;)V

    :cond_42
    return-object p0
.end method

.method public a(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 58
    invoke-super {p0, p1}, Landroidx/transition/Transition;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 59
    :goto_5
    iget-object v2, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_41

    .line 60
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/transition/Transition;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroidx/transition/Transition;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_41
    return-object v0
.end method

.method public a()V
    .registers 4

    .line 47
    invoke-super {p0}, Landroidx/transition/Transition;->a()V

    .line 48
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_1a

    .line 49
    iget-object v2, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/transition/Transition;

    invoke-virtual {v2}, Landroidx/transition/Transition;->a()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1a
    return-void
.end method

.method public a(Landroid/view/ViewGroup;Lb/s/z;Lb/s/z;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lb/s/z;",
            "Lb/s/z;",
            "Ljava/util/ArrayList<",
            "Lb/s/y;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lb/s/y;",
            ">;)V"
        }
    .end annotation

    move-object v0, p0

    .line 34
    invoke-virtual {p0}, Landroidx/transition/Transition;->j()J

    move-result-wide v1

    .line 35
    iget-object v3, v0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :goto_c
    if-ge v4, v3, :cond_40

    .line 36
    iget-object v5, v0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Landroidx/transition/Transition;

    const-wide/16 v7, 0x0

    cmp-long v5, v1, v7

    if-lez v5, :cond_33

    .line 37
    iget-boolean v5, v0, Landroidx/transition/TransitionSet;->R:Z

    if-nez v5, :cond_23

    if-nez v4, :cond_33

    .line 38
    :cond_23
    invoke-virtual {v6}, Landroidx/transition/Transition;->j()J

    move-result-wide v9

    cmp-long v5, v9, v7

    if-lez v5, :cond_30

    add-long/2addr v9, v1

    .line 39
    invoke-virtual {v6, v9, v10}, Landroidx/transition/Transition;->b(J)Landroidx/transition/Transition;

    goto :goto_33

    .line 40
    :cond_30
    invoke-virtual {v6, v1, v2}, Landroidx/transition/Transition;->b(J)Landroidx/transition/Transition;

    :cond_33
    :goto_33
    move-object v7, p1

    move-object v8, p2

    move-object v9, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    .line 41
    invoke-virtual/range {v6 .. v11}, Landroidx/transition/Transition;->a(Landroid/view/ViewGroup;Lb/s/z;Lb/s/z;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_c

    :cond_40
    return-void
.end method

.method public a(Landroidx/transition/PathMotion;)V
    .registers 4

    .line 29
    invoke-super {p0, p1}, Landroidx/transition/Transition;->a(Landroidx/transition/PathMotion;)V

    .line 30
    iget v0, p0, Landroidx/transition/TransitionSet;->U:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Landroidx/transition/TransitionSet;->U:I

    .line 31
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    if-eqz v0, :cond_24

    const/4 v0, 0x0

    .line 32
    :goto_e
    iget-object v1, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_24

    .line 33
    iget-object v1, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/transition/Transition;

    invoke-virtual {v1, p1}, Landroidx/transition/Transition;->a(Landroidx/transition/PathMotion;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    :cond_24
    return-void
.end method

.method public a(Landroidx/transition/Transition$e;)V
    .registers 5

    .line 54
    invoke-super {p0, p1}, Landroidx/transition/Transition;->a(Landroidx/transition/Transition$e;)V

    .line 55
    iget v0, p0, Landroidx/transition/TransitionSet;->U:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Landroidx/transition/TransitionSet;->U:I

    .line 56
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_10
    if-ge v1, v0, :cond_20

    .line 57
    iget-object v2, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/transition/Transition;

    invoke-virtual {v2, p1}, Landroidx/transition/Transition;->a(Landroidx/transition/Transition$e;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    :cond_20
    return-void
.end method

.method public a(Lb/s/w;)V
    .registers 5

    .line 50
    invoke-super {p0, p1}, Landroidx/transition/Transition;->a(Lb/s/w;)V

    .line 51
    iget v0, p0, Landroidx/transition/TransitionSet;->U:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroidx/transition/TransitionSet;->U:I

    .line 52
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_10
    if-ge v1, v0, :cond_20

    .line 53
    iget-object v2, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/transition/Transition;

    invoke-virtual {v2, p1}, Landroidx/transition/Transition;->a(Lb/s/w;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    :cond_20
    return-void
.end method

.method public a(Lb/s/y;)V
    .registers 5

    .line 42
    iget-object v0, p1, Lb/s/y;->b:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroidx/transition/Transition;->b(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 43
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_e
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/transition/Transition;

    .line 44
    iget-object v2, p1, Lb/s/y;->b:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroidx/transition/Transition;->b(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 45
    invoke-virtual {v1, p1}, Landroidx/transition/Transition;->a(Lb/s/y;)V

    .line 46
    iget-object v2, p1, Lb/s/y;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e

    :cond_2b
    return-void
.end method

.method public b(I)Landroidx/transition/Transition;
    .registers 3

    if-ltz p1, :cond_14

    .line 5
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_b

    goto :goto_14

    .line 6
    :cond_b
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/transition/Transition;

    return-object p1

    :cond_14
    :goto_14
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic b(J)Landroidx/transition/Transition;
    .registers 3

    .line 2
    invoke-virtual {p0, p1, p2}, Landroidx/transition/TransitionSet;->b(J)Landroidx/transition/TransitionSet;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic b(Landroidx/transition/Transition$f;)Landroidx/transition/Transition;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Landroidx/transition/TransitionSet;->b(Landroidx/transition/Transition$f;)Landroidx/transition/TransitionSet;

    move-result-object p1

    return-object p1
.end method

.method public b(J)Landroidx/transition/TransitionSet;
    .registers 3

    .line 7
    invoke-super {p0, p1, p2}, Landroidx/transition/Transition;->b(J)Landroidx/transition/Transition;

    move-object p1, p0

    check-cast p1, Landroidx/transition/TransitionSet;

    return-object p1
.end method

.method public b(Landroidx/transition/Transition$f;)Landroidx/transition/TransitionSet;
    .registers 2

    .line 8
    invoke-super {p0, p1}, Landroidx/transition/Transition;->b(Landroidx/transition/Transition$f;)Landroidx/transition/Transition;

    move-object p1, p0

    check-cast p1, Landroidx/transition/TransitionSet;

    return-object p1
.end method

.method public final b(Landroidx/transition/Transition;)V
    .registers 3

    .line 3
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    iput-object p0, p1, Landroidx/transition/Transition;->y:Landroidx/transition/TransitionSet;

    return-void
.end method

.method public b(Lb/s/y;)V
    .registers 5

    .line 9
    invoke-super {p0, p1}, Landroidx/transition/Transition;->b(Lb/s/y;)V

    .line 10
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_1a

    .line 11
    iget-object v2, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/transition/Transition;

    invoke-virtual {v2, p1}, Landroidx/transition/Transition;->b(Lb/s/y;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1a
    return-void
.end method

.method public c(I)Landroidx/transition/TransitionSet;
    .registers 5

    const/4 v0, 0x1

    if-eqz p1, :cond_20

    if-ne p1, v0, :cond_9

    const/4 p1, 0x0

    .line 1
    iput-boolean p1, p0, Landroidx/transition/TransitionSet;->R:Z

    goto :goto_22

    .line 2
    :cond_9
    new-instance v0, Landroid/util/AndroidRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid parameter for TransitionSet ordering: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3
    :cond_20
    iput-boolean v0, p0, Landroidx/transition/TransitionSet;->R:Z

    :goto_22
    return-object p0
.end method

.method public c(Landroid/view/View;)V
    .registers 5

    .line 9
    invoke-super {p0, p1}, Landroidx/transition/Transition;->c(Landroid/view/View;)V

    .line 10
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_1a

    .line 11
    iget-object v2, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/transition/Transition;

    invoke-virtual {v2, p1}, Landroidx/transition/Transition;->c(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1a
    return-void
.end method

.method public c(Lb/s/y;)V
    .registers 5

    .line 4
    iget-object v0, p1, Lb/s/y;->b:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroidx/transition/Transition;->b(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 5
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_e
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/transition/Transition;

    .line 6
    iget-object v2, p1, Lb/s/y;->b:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroidx/transition/Transition;->b(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 7
    invoke-virtual {v1, p1}, Landroidx/transition/Transition;->c(Lb/s/y;)V

    .line 8
    iget-object v2, p1, Lb/s/y;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e

    :cond_2b
    return-void
.end method

.method public clone()Landroidx/transition/Transition;
    .registers 5

    .line 2
    invoke-super {p0}, Landroidx/transition/Transition;->clone()Landroidx/transition/Transition;

    move-result-object v0

    check-cast v0, Landroidx/transition/TransitionSet;

    .line 3
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    .line 4
    iget-object v1, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_14
    if-ge v2, v1, :cond_28

    .line 5
    iget-object v3, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/transition/Transition;

    invoke-virtual {v3}, Landroidx/transition/Transition;->clone()Landroidx/transition/Transition;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroidx/transition/TransitionSet;->b(Landroidx/transition/Transition;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    :cond_28
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/transition/TransitionSet;->clone()Landroidx/transition/Transition;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic d(Landroid/view/View;)Landroidx/transition/Transition;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Landroidx/transition/TransitionSet;->d(Landroid/view/View;)Landroidx/transition/TransitionSet;

    move-result-object p1

    return-object p1
.end method

.method public d(Landroid/view/View;)Landroidx/transition/TransitionSet;
    .registers 4

    const/4 v0, 0x0

    .line 2
    :goto_1
    iget-object v1, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_17

    .line 3
    iget-object v1, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/transition/Transition;

    invoke-virtual {v1, p1}, Landroidx/transition/Transition;->d(Landroid/view/View;)Landroidx/transition/Transition;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 4
    :cond_17
    invoke-super {p0, p1}, Landroidx/transition/Transition;->d(Landroid/view/View;)Landroidx/transition/Transition;

    move-object p1, p0

    check-cast p1, Landroidx/transition/TransitionSet;

    return-object p1
.end method

.method public e(Landroid/view/View;)V
    .registers 5

    .line 1
    invoke-super {p0, p1}, Landroidx/transition/Transition;->e(Landroid/view/View;)V

    .line 2
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_1a

    .line 3
    iget-object v2, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/transition/Transition;

    invoke-virtual {v2, p1}, Landroidx/transition/Transition;->e(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1a
    return-void
.end method

.method public p()V
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 2
    invoke-virtual {p0}, Landroidx/transition/Transition;->q()V

    .line 3
    invoke-virtual {p0}, Landroidx/transition/Transition;->b()V

    return-void

    .line 4
    :cond_f
    invoke-virtual {p0}, Landroidx/transition/TransitionSet;->t()V

    .line 5
    iget-boolean v0, p0, Landroidx/transition/TransitionSet;->R:Z

    if-nez v0, :cond_4b

    const/4 v0, 0x1

    .line 6
    :goto_17
    iget-object v1, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_3c

    .line 7
    iget-object v1, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/transition/Transition;

    .line 8
    iget-object v2, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/transition/Transition;

    .line 9
    new-instance v3, Landroidx/transition/TransitionSet$a;

    invoke-direct {v3, p0, v2}, Landroidx/transition/TransitionSet$a;-><init>(Landroidx/transition/TransitionSet;Landroidx/transition/Transition;)V

    invoke-virtual {v1, v3}, Landroidx/transition/Transition;->a(Landroidx/transition/Transition$f;)Landroidx/transition/Transition;

    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 10
    :cond_3c
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/transition/Transition;

    if-eqz v0, :cond_61

    .line 11
    invoke-virtual {v0}, Landroidx/transition/Transition;->p()V

    goto :goto_61

    .line 12
    :cond_4b
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_51
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_61

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/transition/Transition;

    .line 13
    invoke-virtual {v1}, Landroidx/transition/Transition;->p()V

    goto :goto_51

    :cond_61
    :goto_61
    return-void
.end method

.method public s()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public final t()V
    .registers 4

    .line 1
    new-instance v0, Landroidx/transition/TransitionSet$b;

    invoke-direct {v0, p0}, Landroidx/transition/TransitionSet$b;-><init>(Landroidx/transition/TransitionSet;)V

    .line 2
    iget-object v1, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/transition/Transition;

    .line 3
    invoke-virtual {v2, v0}, Landroidx/transition/Transition;->a(Landroidx/transition/Transition$f;)Landroidx/transition/Transition;

    goto :goto_b

    .line 4
    :cond_1b
    iget-object v0, p0, Landroidx/transition/TransitionSet;->Q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Landroidx/transition/TransitionSet;->S:I

    return-void
.end method
