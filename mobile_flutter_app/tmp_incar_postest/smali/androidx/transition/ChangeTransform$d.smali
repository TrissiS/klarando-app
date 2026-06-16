.class public Landroidx/transition/ChangeTransform$d;
.super Lb/s/u;
.source "ChangeTransform.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/transition/ChangeTransform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Lb/s/f;


# direct methods
.method public constructor <init>(Landroid/view/View;Lb/s/f;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lb/s/u;-><init>()V

    .line 2
    iput-object p1, p0, Landroidx/transition/ChangeTransform$d;->a:Landroid/view/View;

    .line 3
    iput-object p2, p0, Landroidx/transition/ChangeTransform$d;->b:Lb/s/f;

    return-void
.end method


# virtual methods
.method public a(Landroidx/transition/Transition;)V
    .registers 3

    .line 1
    iget-object p1, p0, Landroidx/transition/ChangeTransform$d;->b:Lb/s/f;

    const/4 v0, 0x4

    invoke-interface {p1, v0}, Lb/s/f;->setVisibility(I)V

    return-void
.end method

.method public b(Landroidx/transition/Transition;)V
    .registers 3

    .line 1
    iget-object p1, p0, Landroidx/transition/ChangeTransform$d;->b:Lb/s/f;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lb/s/f;->setVisibility(I)V

    return-void
.end method

.method public e(Landroidx/transition/Transition;)V
    .registers 4

    .line 1
    invoke-virtual {p1, p0}, Landroidx/transition/Transition;->b(Landroidx/transition/Transition$f;)Landroidx/transition/Transition;

    .line 2
    iget-object p1, p0, Landroidx/transition/ChangeTransform$d;->a:Landroid/view/View;

    invoke-static {p1}, Lb/s/j;->a(Landroid/view/View;)V

    .line 3
    iget-object p1, p0, Landroidx/transition/ChangeTransform$d;->a:Landroid/view/View;

    sget v0, Lb/s/p;->transition_transform:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 4
    iget-object p1, p0, Landroidx/transition/ChangeTransform$d;->a:Landroid/view/View;

    sget v0, Lb/s/p;->parent_matrix:I

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    return-void
.end method
