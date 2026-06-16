.class public abstract Lcom/google/android/material/transformation/ExpandableBehavior;
.super Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
.source "ExpandableBehavior.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public a:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/google/android/material/transformation/ExpandableBehavior;->a:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 3
    invoke-direct {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lcom/google/android/material/transformation/ExpandableBehavior;->a:I

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/transformation/ExpandableBehavior;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/transformation/ExpandableBehavior;->a:I

    return p0
.end method


# virtual methods
.method public abstract a(Landroid/view/View;Landroid/view/View;ZZ)Z
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .registers 6

    .line 2
    invoke-static {p2}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result p3

    if-nez p3, :cond_2d

    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/transformation/ExpandableBehavior;->e(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)Lc/a/a/a/b0/b;

    move-result-object p1

    if-eqz p1, :cond_2d

    .line 4
    invoke-interface {p1}, Lc/a/a/a/b0/b;->a()Z

    move-result p3

    invoke-virtual {p0, p3}, Lcom/google/android/material/transformation/ExpandableBehavior;->a(Z)Z

    move-result p3

    if-eqz p3, :cond_2d

    .line 5
    invoke-interface {p1}, Lc/a/a/a/b0/b;->a()Z

    move-result p3

    if-eqz p3, :cond_1e

    const/4 p3, 0x1

    goto :goto_1f

    :cond_1e
    const/4 p3, 0x2

    :goto_1f
    iput p3, p0, Lcom/google/android/material/transformation/ExpandableBehavior;->a:I

    .line 6
    invoke-virtual {p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/google/android/material/transformation/ExpandableBehavior$a;

    invoke-direct {v1, p0, p2, p3, p1}, Lcom/google/android/material/transformation/ExpandableBehavior$a;-><init>(Lcom/google/android/material/transformation/ExpandableBehavior;Landroid/view/View;ILc/a/a/a/b0/b;)V

    .line 7
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_2d
    const/4 p1, 0x0

    return p1
.end method

.method public final a(Z)Z
    .registers 5

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_d

    .line 8
    iget p1, p0, Lcom/google/android/material/transformation/ExpandableBehavior;->a:I

    if-eqz p1, :cond_b

    const/4 v2, 0x2

    if-ne p1, v2, :cond_c

    :cond_b
    const/4 v0, 0x1

    :cond_c
    return v0

    .line 9
    :cond_d
    iget p1, p0, Lcom/google/android/material/transformation/ExpandableBehavior;->a:I

    if-ne p1, v1, :cond_12

    const/4 v0, 0x1

    :cond_12
    return v0
.end method

.method public b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .registers 5

    .line 1
    check-cast p3, Lc/a/a/a/b0/b;

    .line 2
    invoke-interface {p3}, Lc/a/a/a/b0/b;->a()Z

    move-result p1

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/transformation/ExpandableBehavior;->a(Z)Z

    move-result p1

    if-eqz p1, :cond_24

    .line 4
    invoke-interface {p3}, Lc/a/a/a/b0/b;->a()Z

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_15

    const/4 p1, 0x1

    goto :goto_16

    :cond_15
    const/4 p1, 0x2

    :goto_16
    iput p1, p0, Lcom/google/android/material/transformation/ExpandableBehavior;->a:I

    .line 5
    move-object p1, p3

    check-cast p1, Landroid/view/View;

    invoke-interface {p3}, Lc/a/a/a/b0/b;->a()Z

    move-result p3

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/android/material/transformation/ExpandableBehavior;->a(Landroid/view/View;Landroid/view/View;ZZ)Z

    move-result p1

    return p1

    :cond_24
    const/4 p1, 0x0

    return p1
.end method

.method public e(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)Lc/a/a/a/b0/b;
    .registers 8

    .line 1
    invoke-virtual {p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->b(Landroid/view/View;)Ljava/util/List;

    move-result-object v0

    .line 2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_9
    if-ge v2, v1, :cond_1d

    .line 3
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 4
    invoke-virtual {p0, p1, p2, v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 5
    check-cast v3, Lc/a/a/a/b0/b;

    return-object v3

    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_1d
    const/4 p1, 0x0

    return-object p1
.end method
