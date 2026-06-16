.class public Landroidx/constraintlayout/motion/widget/MotionLayout$e;
.super Ljava/lang/Object;
.source "MotionLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/motion/widget/MotionLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field public a:Lb/f/b/k/f;

.field public b:Lb/f/b/k/f;

.field public c:Lb/f/c/c;

.field public d:Lb/f/c/c;

.field public e:I

.field public f:I

.field public final synthetic g:Landroidx/constraintlayout/motion/widget/MotionLayout;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance p1, Lb/f/b/k/f;

    invoke-direct {p1}, Lb/f/b/k/f;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    .line 3
    new-instance p1, Lb/f/b/k/f;

    invoke-direct {p1}, Lb/f/b/k/f;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->c:Lb/f/c/c;

    .line 5
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->d:Lb/f/c/c;

    return-void
.end method


# virtual methods
.method public a(Lb/f/b/k/f;Landroid/view/View;)Lb/f/b/k/e;
    .registers 7

    .line 77
    invoke-virtual {p1}, Lb/f/b/k/e;->g()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_7

    return-object p1

    .line 78
    :cond_7
    invoke-virtual {p1}, Lb/f/b/k/m;->J()Ljava/util/ArrayList;

    move-result-object p1

    .line 79
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_10
    if-ge v1, v0, :cond_22

    .line 80
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/e;

    .line 81
    invoke-virtual {v2}, Lb/f/b/k/e;->g()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p2, :cond_1f

    return-object v2

    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    :cond_22
    const/4 p1, 0x0

    return-object p1
.end method

.method public a()V
    .registers 11

    .line 82
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 83
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v1, v1, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_f
    if-ge v2, v0, :cond_26

    .line 84
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 85
    new-instance v4, Lb/f/a/b/n;

    invoke-direct {v4, v3}, Lb/f/a/b/n;-><init>(Landroid/view/View;)V

    .line 86
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v5, v5, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {v5, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    :cond_26
    :goto_26
    if-ge v1, v0, :cond_d4

    .line 87
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 88
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v3, v3, Landroidx/constraintlayout/motion/widget/MotionLayout;->H:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/a/b/n;

    if-nez v3, :cond_3c

    goto/16 :goto_d0

    .line 89
    :cond_3c
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->c:Lb/f/c/c;

    const-string v5, ")"

    const-string v6, " ("

    const-string v7, "no widget for  "

    const-string v8, "MotionLayout"

    if-eqz v4, :cond_8a

    .line 90
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    invoke-virtual {p0, v4, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a(Lb/f/b/k/f;Landroid/view/View;)Lb/f/b/k/e;

    move-result-object v4

    if-eqz v4, :cond_56

    .line 91
    iget-object v9, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->c:Lb/f/c/c;

    invoke-virtual {v3, v4, v9}, Lb/f/a/b/n;->b(Lb/f/b/k/e;Lb/f/c/c;)V

    goto :goto_8a

    .line 92
    :cond_56
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget v4, v4, Landroidx/constraintlayout/motion/widget/MotionLayout;->T:I

    if-eqz v4, :cond_8a

    .line 93
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lb/f/a/b/a;->a()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2}, Lb/f/a/b/a;->a(Landroid/view/View;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v8, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    :cond_8a
    :goto_8a
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->d:Lb/f/c/c;

    if-eqz v4, :cond_d0

    .line 95
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    invoke-virtual {p0, v4, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a(Lb/f/b/k/f;Landroid/view/View;)Lb/f/b/k/e;

    move-result-object v4

    if-eqz v4, :cond_9c

    .line 96
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->d:Lb/f/c/c;

    invoke-virtual {v3, v4, v2}, Lb/f/a/b/n;->a(Lb/f/b/k/e;Lb/f/c/c;)V

    goto :goto_d0

    .line 97
    :cond_9c
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget v3, v3, Landroidx/constraintlayout/motion/widget/MotionLayout;->T:I

    if-eqz v3, :cond_d0

    .line 98
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lb/f/a/b/a;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2}, Lb/f/a/b/a;->a(Landroid/view/View;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v8, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_d0
    :goto_d0
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_26

    :cond_d4
    return-void
.end method

.method public a(Lb/f/b/k/f;Lb/f/b/k/f;)V
    .registers 7

    .line 1
    invoke-virtual {p1}, Lb/f/b/k/m;->J()Ljava/util/ArrayList;

    move-result-object v0

    .line 2
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 3
    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    invoke-virtual {p2}, Lb/f/b/k/m;->J()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 5
    invoke-virtual {p2, p1, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/e;Ljava/util/HashMap;)V

    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/e;

    .line 7
    instance-of v3, v2, Lb/f/b/k/a;

    if-eqz v3, :cond_30

    .line 8
    new-instance v3, Lb/f/b/k/a;

    invoke-direct {v3}, Lb/f/b/k/a;-><init>()V

    goto :goto_53

    .line 9
    :cond_30
    instance-of v3, v2, Lb/f/b/k/h;

    if-eqz v3, :cond_3a

    .line 10
    new-instance v3, Lb/f/b/k/h;

    invoke-direct {v3}, Lb/f/b/k/h;-><init>()V

    goto :goto_53

    .line 11
    :cond_3a
    instance-of v3, v2, Lb/f/b/k/g;

    if-eqz v3, :cond_44

    .line 12
    new-instance v3, Lb/f/b/k/g;

    invoke-direct {v3}, Lb/f/b/k/g;-><init>()V

    goto :goto_53

    .line 13
    :cond_44
    instance-of v3, v2, Lb/f/b/k/i;

    if-eqz v3, :cond_4e

    .line 14
    new-instance v3, Lb/f/b/k/j;

    invoke-direct {v3}, Lb/f/b/k/j;-><init>()V

    goto :goto_53

    .line 15
    :cond_4e
    new-instance v3, Lb/f/b/k/e;

    invoke-direct {v3}, Lb/f/b/k/e;-><init>()V

    .line 16
    :goto_53
    invoke-virtual {p2, v3}, Lb/f/b/k/m;->a(Lb/f/b/k/e;)V

    .line 17
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1a

    .line 18
    :cond_5a
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_5e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_74

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lb/f/b/k/e;

    .line 19
    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/e;

    invoke-virtual {v0, p2, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/e;Ljava/util/HashMap;)V

    goto :goto_5e

    :cond_74
    return-void
.end method

.method public final a(Lb/f/b/k/f;Lb/f/c/c;)V
    .registers 15

    .line 46
    new-instance v6, Landroid/util/SparseArray;

    invoke-direct {v6}, Landroid/util/SparseArray;-><init>()V

    .line 47
    new-instance v7, Landroidx/constraintlayout/widget/Constraints$LayoutParams;

    const/4 v0, -0x2

    invoke-direct {v7, v0, v0}, Landroidx/constraintlayout/widget/Constraints$LayoutParams;-><init>(II)V

    .line 48
    invoke-virtual {v6}, Landroid/util/SparseArray;->clear()V

    const/4 v8, 0x0

    .line 49
    invoke-virtual {v6, v8, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 50
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getId()I

    move-result v0

    invoke-virtual {v6, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 51
    invoke-virtual {p1}, Lb/f/b/k/m;->J()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_23
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/e;

    .line 52
    invoke-virtual {v1}, Lb/f/b/k/e;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 53
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v6, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_23

    .line 54
    :cond_3d
    invoke-virtual {p1}, Lb/f/b/k/m;->J()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_45
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c7

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Lb/f/b/k/e;

    .line 55
    invoke-virtual {v10}, Lb/f/b/k/e;->g()Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Landroid/view/View;

    .line 56
    invoke-virtual {v11}, Landroid/view/View;->getId()I

    move-result v0

    invoke-virtual {p2, v0, v7}, Lb/f/c/c;->a(ILandroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;)V

    .line 57
    invoke-virtual {v11}, Landroid/view/View;->getId()I

    move-result v0

    invoke-virtual {p2, v0}, Lb/f/c/c;->g(I)I

    move-result v0

    invoke-virtual {v10, v0}, Lb/f/b/k/e;->q(I)V

    .line 58
    invoke-virtual {v11}, Landroid/view/View;->getId()I

    move-result v0

    invoke-virtual {p2, v0}, Lb/f/c/c;->c(I)I

    move-result v0

    invoke-virtual {v10, v0}, Lb/f/b/k/e;->i(I)V

    .line 59
    instance-of v0, v11, Landroidx/constraintlayout/widget/ConstraintHelper;

    if-eqz v0, :cond_8a

    .line 60
    move-object v0, v11

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintHelper;

    invoke-virtual {p2, v0, v10, v7, v6}, Lb/f/c/c;->a(Landroidx/constraintlayout/widget/ConstraintHelper;Lb/f/b/k/e;Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;Landroid/util/SparseArray;)V

    .line 61
    instance-of v0, v11, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v0, :cond_8a

    .line 62
    move-object v0, v11

    check-cast v0, Landroidx/constraintlayout/widget/Barrier;

    invoke-virtual {v0}, Landroidx/constraintlayout/widget/ConstraintHelper;->b()V

    .line 63
    :cond_8a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_9a

    .line 64
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutDirection()I

    move-result v0

    invoke-virtual {v7, v0}, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->resolveLayoutDirection(I)V

    goto :goto_9d

    .line 65
    :cond_9a
    invoke-virtual {v7, v8}, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->resolveLayoutDirection(I)V

    .line 66
    :goto_9d
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    const/4 v1, 0x0

    move-object v2, v11

    move-object v3, v10

    move-object v4, v7

    move-object v5, v6

    invoke-static/range {v0 .. v5}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;ZLandroid/view/View;Lb/f/b/k/e;Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;Landroid/util/SparseArray;)V

    .line 67
    invoke-virtual {v11}, Landroid/view/View;->getId()I

    move-result v0

    invoke-virtual {p2, v0}, Lb/f/c/c;->f(I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_ba

    .line 68
    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v0

    invoke-virtual {v10, v0}, Lb/f/b/k/e;->p(I)V

    goto :goto_45

    .line 69
    :cond_ba
    invoke-virtual {v11}, Landroid/view/View;->getId()I

    move-result v0

    invoke-virtual {p2, v0}, Lb/f/c/c;->e(I)I

    move-result v0

    invoke-virtual {v10, v0}, Lb/f/b/k/e;->p(I)V

    goto/16 :goto_45

    .line 70
    :cond_c7
    invoke-virtual {p1}, Lb/f/b/k/m;->J()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_cf
    :goto_cf
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/e;

    .line 71
    instance-of v1, v0, Lb/f/b/k/l;

    if-eqz v1, :cond_cf

    .line 72
    invoke-virtual {v0}, Lb/f/b/k/e;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 73
    check-cast v0, Lb/f/b/k/i;

    .line 74
    invoke-virtual {v1, p1, v0, v6}, Landroidx/constraintlayout/widget/ConstraintHelper;->a(Lb/f/b/k/f;Lb/f/b/k/i;Landroid/util/SparseArray;)V

    .line 75
    check-cast v0, Lb/f/b/k/l;

    .line 76
    invoke-virtual {v0}, Lb/f/b/k/l;->J()V

    goto :goto_cf

    :cond_f0
    return-void
.end method

.method public a(Lb/f/b/k/f;Lb/f/c/c;Lb/f/c/c;)V
    .registers 8

    .line 20
    iput-object p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->c:Lb/f/c/c;

    .line 21
    iput-object p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->d:Lb/f/c/c;

    .line 22
    new-instance p1, Lb/f/b/k/f;

    invoke-direct {p1}, Lb/f/b/k/f;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    .line 23
    new-instance p1, Lb/f/b/k/f;

    invoke-direct {p1}, Lb/f/b/k/f;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    .line 24
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-static {v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->e(Landroidx/constraintlayout/motion/widget/MotionLayout;)Lb/f/b/k/f;

    move-result-object v0

    invoke-virtual {v0}, Lb/f/b/k/f;->M()Lb/f/b/k/n/b$b;

    move-result-object v0

    invoke-virtual {p1, v0}, Lb/f/b/k/f;->a(Lb/f/b/k/n/b$b;)V

    .line 25
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-static {v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->f(Landroidx/constraintlayout/motion/widget/MotionLayout;)Lb/f/b/k/f;

    move-result-object v0

    invoke-virtual {v0}, Lb/f/b/k/f;->M()Lb/f/b/k/n/b$b;

    move-result-object v0

    invoke-virtual {p1, v0}, Lb/f/b/k/f;->a(Lb/f/b/k/n/b$b;)V

    .line 26
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    invoke-virtual {p1}, Lb/f/b/k/m;->L()V

    .line 27
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    invoke-virtual {p1}, Lb/f/b/k/m;->L()V

    .line 28
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-static {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->g(Landroidx/constraintlayout/motion/widget/MotionLayout;)Lb/f/b/k/f;

    move-result-object p1

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    invoke-virtual {p0, p1, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a(Lb/f/b/k/f;Lb/f/b/k/f;)V

    .line 29
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-static {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->h(Landroidx/constraintlayout/motion/widget/MotionLayout;)Lb/f/b/k/f;

    move-result-object p1

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    invoke-virtual {p0, p1, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a(Lb/f/b/k/f;Lb/f/b/k/f;)V

    .line 30
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget p1, p1, Landroidx/constraintlayout/motion/widget/MotionLayout;->L:F

    float-to-double v0, p1

    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    cmpl-double p1, v0, v2

    if-lez p1, :cond_68

    if-eqz p2, :cond_62

    .line 31
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    invoke-virtual {p0, p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a(Lb/f/b/k/f;Lb/f/c/c;)V

    .line 32
    :cond_62
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    invoke-virtual {p0, p1, p3}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a(Lb/f/b/k/f;Lb/f/c/c;)V

    goto :goto_74

    .line 33
    :cond_68
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    invoke-virtual {p0, p1, p3}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a(Lb/f/b/k/f;Lb/f/c/c;)V

    if-eqz p2, :cond_74

    .line 34
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    invoke-virtual {p0, p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a(Lb/f/b/k/f;Lb/f/c/c;)V

    .line 35
    :cond_74
    :goto_74
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    iget-object p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-static {p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->i(Landroidx/constraintlayout/motion/widget/MotionLayout;)Z

    move-result p2

    invoke-virtual {p1, p2}, Lb/f/b/k/f;->f(Z)V

    .line 36
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    invoke-virtual {p1}, Lb/f/b/k/f;->V()V

    .line 37
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    iget-object p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-static {p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->j(Landroidx/constraintlayout/motion/widget/MotionLayout;)Z

    move-result p2

    invoke-virtual {p1, p2}, Lb/f/b/k/f;->f(Z)V

    .line 38
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    invoke-virtual {p1}, Lb/f/b/k/f;->V()V

    .line 39
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    if-eqz p1, :cond_c1

    .line 40
    iget p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 p3, -0x2

    if-ne p2, p3, :cond_af

    .line 41
    iget-object p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    sget-object v0, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    invoke-virtual {p2, v0}, Lb/f/b/k/e;->a(Lb/f/b/k/e$b;)V

    .line 42
    iget-object p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    sget-object v0, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    invoke-virtual {p2, v0}, Lb/f/b/k/e;->a(Lb/f/b/k/e$b;)V

    .line 43
    :cond_af
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne p1, p3, :cond_c1

    .line 44
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    sget-object p2, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    invoke-virtual {p1, p2}, Lb/f/b/k/e;->b(Lb/f/b/k/e$b;)V

    .line 45
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    sget-object p2, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    invoke-virtual {p1, p2}, Lb/f/b/k/e;->b(Lb/f/b/k/e$b;)V

    :cond_c1
    return-void
.end method

.method public a(II)Z
    .registers 4

    .line 99
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->e:I

    if-ne p1, v0, :cond_b

    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->f:I

    if-eq p2, p1, :cond_9

    goto :goto_b

    :cond_9
    const/4 p1, 0x0

    goto :goto_c

    :cond_b
    :goto_b
    const/4 p1, 0x1

    :goto_c
    return p1
.end method

.method public b()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-static {v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->k(Landroidx/constraintlayout/motion/widget/MotionLayout;)I

    move-result v0

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-static {v1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->c(Landroidx/constraintlayout/motion/widget/MotionLayout;)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b(II)V

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-static {v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->d(Landroidx/constraintlayout/motion/widget/MotionLayout;)V

    return-void
.end method

.method public b(II)V
    .registers 16

    .line 3
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 4
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 5
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iput v0, v2, Landroidx/constraintlayout/motion/widget/MotionLayout;->x0:I

    .line 6
    iput v1, v2, Landroidx/constraintlayout/motion/widget/MotionLayout;->y0:I

    .line 7
    invoke-virtual {v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->getOptimizationLevel()I

    move-result v2

    .line 8
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget v4, v3, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    invoke-virtual {v3}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getStartState()I

    move-result v3

    if-ne v4, v3, :cond_2f

    .line 9
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    invoke-static {v3, v4, v2, p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V

    .line 10
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->c:Lb/f/c/c;

    if-eqz v3, :cond_41

    .line 11
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    invoke-static {v3, v4, v2, p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->b(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V

    goto :goto_41

    .line 12
    :cond_2f
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->c:Lb/f/c/c;

    if-eqz v3, :cond_3a

    .line 13
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    invoke-static {v3, v4, v2, p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->c(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V

    .line 14
    :cond_3a
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    invoke-static {v3, v4, v2, p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->d(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V

    .line 15
    :cond_41
    :goto_41
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroidx/constraintlayout/motion/widget/MotionLayout;

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_55

    const/high16 v3, 0x40000000    # 2.0f

    if-ne v0, v3, :cond_55

    if-ne v1, v3, :cond_55

    const/4 v3, 0x0

    goto :goto_56

    :cond_55
    const/4 v3, 0x1

    :goto_56
    if-eqz v3, :cond_c7

    .line 16
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iput v0, v3, Landroidx/constraintlayout/motion/widget/MotionLayout;->x0:I

    .line 17
    iput v1, v3, Landroidx/constraintlayout/motion/widget/MotionLayout;->y0:I

    .line 18
    iget v0, v3, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    invoke-virtual {v3}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getStartState()I

    move-result v1

    if-ne v0, v1, :cond_79

    .line 19
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    invoke-static {v0, v1, v2, p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->e(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V

    .line 20
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->c:Lb/f/c/c;

    if-eqz v0, :cond_8b

    .line 21
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    invoke-static {v0, v1, v2, p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->f(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V

    goto :goto_8b

    .line 22
    :cond_79
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->c:Lb/f/c/c;

    if-eqz v0, :cond_84

    .line 23
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    invoke-static {v0, v1, v2, p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->g(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V

    .line 24
    :cond_84
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    invoke-static {v0, v1, v2, p1, p2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->h(Landroidx/constraintlayout/motion/widget/MotionLayout;Lb/f/b/k/f;III)V

    .line 25
    :cond_8b
    :goto_8b
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v1

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->t0:I

    .line 26
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v1

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->u0:I

    .line 27
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v1

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->v0:I

    .line 28
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v1

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->w0:I

    .line 29
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->t0:I

    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->v0:I

    if-ne v1, v2, :cond_c4

    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->u0:I

    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->w0:I

    if-eq v1, v2, :cond_c2

    goto :goto_c4

    :cond_c2
    const/4 v1, 0x0

    goto :goto_c5

    :cond_c4
    :goto_c4
    const/4 v1, 0x1

    :goto_c5
    iput-boolean v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->s0:Z

    .line 30
    :cond_c7
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->t0:I

    .line 31
    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->u0:I

    .line 32
    iget v0, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->x0:I

    const/high16 v3, -0x80000000

    if-eq v0, v3, :cond_d5

    if-nez v0, :cond_e4

    .line 33
    :cond_d5
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->t0:I

    int-to-float v6, v1

    iget v7, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z0:F

    iget v0, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->v0:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    mul-float v7, v7, v0

    add-float/2addr v6, v7

    float-to-int v1, v6

    :cond_e4
    move v9, v1

    .line 34
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget v0, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->y0:I

    if-eq v0, v3, :cond_ed

    if-nez v0, :cond_fc

    .line 35
    :cond_ed
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->u0:I

    int-to-float v2, v1

    iget v3, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->z0:F

    iget v0, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->w0:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    mul-float v3, v3, v0

    add-float/2addr v2, v3

    float-to-int v2, v2

    :cond_fc
    move v10, v2

    .line 36
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    invoke-virtual {v0}, Lb/f/b/k/f;->T()Z

    move-result v0

    if-nez v0, :cond_110

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    .line 37
    invoke-virtual {v0}, Lb/f/b/k/f;->T()Z

    move-result v0

    if-eqz v0, :cond_10e

    goto :goto_110

    :cond_10e
    const/4 v11, 0x0

    goto :goto_111

    :cond_110
    :goto_110
    const/4 v11, 0x1

    .line 38
    :goto_111
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->a:Lb/f/b/k/f;

    invoke-virtual {v0}, Lb/f/b/k/f;->R()Z

    move-result v0

    if-nez v0, :cond_124

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->b:Lb/f/b/k/f;

    .line 39
    invoke-virtual {v0}, Lb/f/b/k/f;->R()Z

    move-result v0

    if-eqz v0, :cond_122

    goto :goto_124

    :cond_122
    const/4 v12, 0x0

    goto :goto_125

    :cond_124
    :goto_124
    const/4 v12, 0x1

    .line 40
    :goto_125
    iget-object v6, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->g:Landroidx/constraintlayout/motion/widget/MotionLayout;

    move v7, p1

    move v8, p2

    invoke-static/range {v6 .. v12}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(Landroidx/constraintlayout/motion/widget/MotionLayout;IIIIZZ)V

    return-void
.end method

.method public c(II)V
    .registers 3

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->e:I

    .line 2
    iput p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$e;->f:I

    return-void
.end method
