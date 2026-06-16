.class public Lb/s/e;
.super Lb/l/d/t;
.source "FragmentTransitionSupport.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "RestrictedApi"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lb/l/d/t;-><init>()V

    return-void
.end method

.method public static a(Landroidx/transition/Transition;)Z
    .registers 2

    .line 13
    invoke-virtual {p0}, Landroidx/transition/Transition;->k()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lb/l/d/t;->a(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 14
    invoke-virtual {p0}, Landroidx/transition/Transition;->l()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lb/l/d/t;->a(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 15
    invoke-virtual {p0}, Landroidx/transition/Transition;->m()Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lb/l/d/t;->a(Ljava/util/List;)Z

    move-result p0

    if-nez p0, :cond_1f

    goto :goto_21

    :cond_1f
    const/4 p0, 0x0

    goto :goto_22

    :cond_21
    :goto_21
    const/4 p0, 0x1

    :goto_22
    return p0
.end method


# virtual methods
.method public a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    .line 18
    check-cast p1, Landroidx/transition/Transition;

    .line 19
    check-cast p2, Landroidx/transition/Transition;

    .line 20
    check-cast p3, Landroidx/transition/Transition;

    if-eqz p1, :cond_1b

    if-eqz p2, :cond_1b

    .line 21
    new-instance v0, Landroidx/transition/TransitionSet;

    invoke-direct {v0}, Landroidx/transition/TransitionSet;-><init>()V

    .line 22
    invoke-virtual {v0, p1}, Landroidx/transition/TransitionSet;->a(Landroidx/transition/Transition;)Landroidx/transition/TransitionSet;

    .line 23
    invoke-virtual {v0, p2}, Landroidx/transition/TransitionSet;->a(Landroidx/transition/Transition;)Landroidx/transition/TransitionSet;

    const/4 p1, 0x1

    .line 24
    invoke-virtual {v0, p1}, Landroidx/transition/TransitionSet;->c(I)Landroidx/transition/TransitionSet;

    move-object p1, v0

    goto :goto_23

    :cond_1b
    if-eqz p1, :cond_1e

    goto :goto_23

    :cond_1e
    if-eqz p2, :cond_22

    move-object p1, p2

    goto :goto_23

    :cond_22
    const/4 p1, 0x0

    :goto_23
    if-eqz p3, :cond_33

    .line 25
    new-instance p2, Landroidx/transition/TransitionSet;

    invoke-direct {p2}, Landroidx/transition/TransitionSet;-><init>()V

    if-eqz p1, :cond_2f

    .line 26
    invoke-virtual {p2, p1}, Landroidx/transition/TransitionSet;->a(Landroidx/transition/Transition;)Landroidx/transition/TransitionSet;

    .line 27
    :cond_2f
    invoke-virtual {p2, p3}, Landroidx/transition/TransitionSet;->a(Landroidx/transition/Transition;)Landroidx/transition/TransitionSet;

    return-object p2

    :cond_33
    return-object p1
.end method

.method public a(Landroid/view/ViewGroup;Ljava/lang/Object;)V
    .registers 3

    .line 28
    check-cast p2, Landroidx/transition/Transition;

    invoke-static {p1, p2}, Lb/s/v;->a(Landroid/view/ViewGroup;Landroidx/transition/Transition;)V

    return-void
.end method

.method public a(Ljava/lang/Object;Landroid/graphics/Rect;)V
    .registers 4

    if-eqz p1, :cond_c

    .line 47
    check-cast p1, Landroidx/transition/Transition;

    .line 48
    new-instance v0, Lb/s/e$d;

    invoke-direct {v0, p0, p2}, Lb/s/e$d;-><init>(Lb/s/e;Landroid/graphics/Rect;)V

    invoke-virtual {p1, v0}, Landroidx/transition/Transition;->a(Landroidx/transition/Transition$e;)V

    :cond_c
    return-void
.end method

.method public a(Ljava/lang/Object;Landroid/view/View;)V
    .registers 3

    if-eqz p1, :cond_7

    .line 45
    check-cast p1, Landroidx/transition/Transition;

    .line 46
    invoke-virtual {p1, p2}, Landroidx/transition/Transition;->a(Landroid/view/View;)Landroidx/transition/Transition;

    :cond_7
    return-void
.end method

.method public a(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Landroid/view/View;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 16
    check-cast p1, Landroidx/transition/Transition;

    .line 17
    new-instance v0, Lb/s/e$b;

    invoke-direct {v0, p0, p2, p3}, Lb/s/e$b;-><init>(Lb/s/e;Landroid/view/View;Ljava/util/ArrayList;)V

    invoke-virtual {p1, v0}, Landroidx/transition/Transition;->a(Landroidx/transition/Transition$f;)Landroidx/transition/Transition;

    return-void
.end method

.method public a(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 29
    move-object v0, p1

    check-cast v0, Landroidx/transition/Transition;

    .line 30
    new-instance v9, Lb/s/e$c;

    move-object v1, v9

    move-object v2, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v1 .. v8}, Lb/s/e$c;-><init>(Lb/s/e;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v9}, Landroidx/transition/Transition;->a(Landroidx/transition/Transition$f;)Landroidx/transition/Transition;

    return-void
.end method

.method public a(Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 2
    check-cast p1, Landroidx/transition/Transition;

    if-nez p1, :cond_5

    return-void

    .line 3
    :cond_5
    instance-of v0, p1, Landroidx/transition/TransitionSet;

    const/4 v1, 0x0

    if-eqz v0, :cond_1c

    .line 4
    check-cast p1, Landroidx/transition/TransitionSet;

    .line 5
    invoke-virtual {p1}, Landroidx/transition/TransitionSet;->s()I

    move-result v0

    :goto_10
    if-ge v1, v0, :cond_3e

    .line 6
    invoke-virtual {p1, v1}, Landroidx/transition/TransitionSet;->b(I)Landroidx/transition/Transition;

    move-result-object v2

    .line 7
    invoke-virtual {p0, v2, p2}, Lb/s/e;->a(Ljava/lang/Object;Ljava/util/ArrayList;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 8
    :cond_1c
    invoke-static {p1}, Lb/s/e;->a(Landroidx/transition/Transition;)Z

    move-result v0

    if-nez v0, :cond_3e

    .line 9
    invoke-virtual {p1}, Landroidx/transition/Transition;->n()Ljava/util/List;

    move-result-object v0

    .line 10
    invoke-static {v0}, Lb/l/d/t;->a(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 11
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_30
    if-ge v1, v0, :cond_3e

    .line 12
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {p1, v2}, Landroidx/transition/Transition;->a(Landroid/view/View;)Landroidx/transition/Transition;

    add-int/lit8 v1, v1, 0x1

    goto :goto_30

    :cond_3e
    return-void
.end method

.method public a(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 31
    check-cast p1, Landroidx/transition/Transition;

    .line 32
    instance-of v0, p1, Landroidx/transition/TransitionSet;

    const/4 v1, 0x0

    if-eqz v0, :cond_19

    .line 33
    check-cast p1, Landroidx/transition/TransitionSet;

    .line 34
    invoke-virtual {p1}, Landroidx/transition/TransitionSet;->s()I

    move-result v0

    :goto_d
    if-ge v1, v0, :cond_5d

    .line 35
    invoke-virtual {p1, v1}, Landroidx/transition/TransitionSet;->b(I)Landroidx/transition/Transition;

    move-result-object v2

    .line 36
    invoke-virtual {p0, v2, p2, p3}, Lb/s/e;->a(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 37
    :cond_19
    invoke-static {p1}, Lb/s/e;->a(Landroidx/transition/Transition;)Z

    move-result v0

    if-nez v0, :cond_5d

    .line 38
    invoke-virtual {p1}, Landroidx/transition/Transition;->n()Ljava/util/List;

    move-result-object v0

    .line 39
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_5d

    .line 40
    invoke-interface {v0, p2}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_5d

    if-nez p3, :cond_37

    const/4 v0, 0x0

    goto :goto_3b

    .line 41
    :cond_37
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_3b
    if-ge v1, v0, :cond_49

    .line 42
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {p1, v2}, Landroidx/transition/Transition;->a(Landroid/view/View;)Landroidx/transition/Transition;

    add-int/lit8 v1, v1, 0x1

    goto :goto_3b

    .line 43
    :cond_49
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    :goto_4f
    if-ltz p3, :cond_5d

    .line 44
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {p1, v0}, Landroidx/transition/Transition;->d(Landroid/view/View;)Landroidx/transition/Transition;

    add-int/lit8 p3, p3, -0x1

    goto :goto_4f

    :cond_5d
    return-void
.end method

.method public a(Ljava/lang/Object;)Z
    .registers 2

    .line 1
    instance-of p1, p1, Landroidx/transition/Transition;

    return p1
.end method

.method public b(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    if-eqz p1, :cond_9

    .line 1
    check-cast p1, Landroidx/transition/Transition;

    invoke-virtual {p1}, Landroidx/transition/Transition;->clone()Landroidx/transition/Transition;

    move-result-object p1

    goto :goto_a

    :cond_9
    const/4 p1, 0x0

    :goto_a
    return-object p1
.end method

.method public b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    .line 11
    new-instance v0, Landroidx/transition/TransitionSet;

    invoke-direct {v0}, Landroidx/transition/TransitionSet;-><init>()V

    if-eqz p1, :cond_c

    .line 12
    check-cast p1, Landroidx/transition/Transition;

    invoke-virtual {v0, p1}, Landroidx/transition/TransitionSet;->a(Landroidx/transition/Transition;)Landroidx/transition/TransitionSet;

    :cond_c
    if-eqz p2, :cond_13

    .line 13
    check-cast p2, Landroidx/transition/Transition;

    invoke-virtual {v0, p2}, Landroidx/transition/TransitionSet;->a(Landroidx/transition/Transition;)Landroidx/transition/TransitionSet;

    :cond_13
    if-eqz p3, :cond_1a

    .line 14
    check-cast p3, Landroidx/transition/Transition;

    invoke-virtual {v0, p3}, Landroidx/transition/TransitionSet;->a(Landroidx/transition/Transition;)Landroidx/transition/TransitionSet;

    :cond_1a
    return-object v0
.end method

.method public b(Ljava/lang/Object;Landroid/view/View;)V
    .registers 3

    if-eqz p1, :cond_7

    .line 19
    check-cast p1, Landroidx/transition/Transition;

    .line 20
    invoke-virtual {p1, p2}, Landroidx/transition/Transition;->d(Landroid/view/View;)Landroidx/transition/Transition;

    :cond_7
    return-void
.end method

.method public b(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Landroid/view/View;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 2
    check-cast p1, Landroidx/transition/TransitionSet;

    .line 3
    invoke-virtual {p1}, Landroidx/transition/Transition;->n()Ljava/util/List;

    move-result-object v0

    .line 4
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 5
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_e
    if-ge v2, v1, :cond_1c

    .line 6
    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 7
    invoke-static {v0, v3}, Lb/l/d/t;->a(Ljava/util/List;Landroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 8
    :cond_1c
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    invoke-virtual {p0, p1, p3}, Lb/s/e;->a(Ljava/lang/Object;Ljava/util/ArrayList;)V

    return-void
.end method

.method public b(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 15
    check-cast p1, Landroidx/transition/TransitionSet;

    if-eqz p1, :cond_15

    .line 16
    invoke-virtual {p1}, Landroidx/transition/Transition;->n()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 17
    invoke-virtual {p1}, Landroidx/transition/Transition;->n()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 18
    invoke-virtual {p0, p1, p2, p3}, Lb/s/e;->a(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    :cond_15
    return-void
.end method

.method public c(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    if-nez p1, :cond_4

    const/4 p1, 0x0

    return-object p1

    .line 1
    :cond_4
    new-instance v0, Landroidx/transition/TransitionSet;

    invoke-direct {v0}, Landroidx/transition/TransitionSet;-><init>()V

    .line 2
    check-cast p1, Landroidx/transition/Transition;

    invoke-virtual {v0, p1}, Landroidx/transition/TransitionSet;->a(Landroidx/transition/Transition;)Landroidx/transition/TransitionSet;

    return-object v0
.end method

.method public c(Ljava/lang/Object;Landroid/view/View;)V
    .registers 4

    if-eqz p2, :cond_14

    .line 3
    check-cast p1, Landroidx/transition/Transition;

    .line 4
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 5
    invoke-virtual {p0, p2, v0}, Lb/l/d/t;->a(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 6
    new-instance p2, Lb/s/e$a;

    invoke-direct {p2, p0, v0}, Lb/s/e$a;-><init>(Lb/s/e;Landroid/graphics/Rect;)V

    invoke-virtual {p1, p2}, Landroidx/transition/Transition;->a(Landroidx/transition/Transition$e;)V

    :cond_14
    return-void
.end method
