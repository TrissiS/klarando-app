.class public Landroidx/transition/ChangeBounds$j;
.super Lb/s/u;
.source "ChangeBounds.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/transition/ChangeBounds;->a(Landroid/view/ViewGroup;Lb/s/y;Lb/s/y;)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroidx/transition/ChangeBounds;Landroid/view/ViewGroup;)V
    .registers 3

    .line 1
    iput-object p2, p0, Landroidx/transition/ChangeBounds$j;->b:Landroid/view/ViewGroup;

    invoke-direct {p0}, Lb/s/u;-><init>()V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Landroidx/transition/ChangeBounds$j;->a:Z

    return-void
.end method


# virtual methods
.method public a(Landroidx/transition/Transition;)V
    .registers 3

    .line 1
    iget-object p1, p0, Landroidx/transition/ChangeBounds$j;->b:Landroid/view/ViewGroup;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lb/s/e0;->b(Landroid/view/ViewGroup;Z)V

    return-void
.end method

.method public b(Landroidx/transition/Transition;)V
    .registers 3

    .line 1
    iget-object p1, p0, Landroidx/transition/ChangeBounds$j;->b:Landroid/view/ViewGroup;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lb/s/e0;->b(Landroid/view/ViewGroup;Z)V

    return-void
.end method

.method public d(Landroidx/transition/Transition;)V
    .registers 3

    .line 1
    iget-object p1, p0, Landroidx/transition/ChangeBounds$j;->b:Landroid/view/ViewGroup;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lb/s/e0;->b(Landroid/view/ViewGroup;Z)V

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Landroidx/transition/ChangeBounds$j;->a:Z

    return-void
.end method

.method public e(Landroidx/transition/Transition;)V
    .registers 4

    .line 1
    iget-boolean v0, p0, Landroidx/transition/ChangeBounds$j;->a:Z

    if-nez v0, :cond_a

    .line 2
    iget-object v0, p0, Landroidx/transition/ChangeBounds$j;->b:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lb/s/e0;->b(Landroid/view/ViewGroup;Z)V

    .line 3
    :cond_a
    invoke-virtual {p1, p0}, Landroidx/transition/Transition;->b(Landroidx/transition/Transition$f;)Landroidx/transition/Transition;

    return-void
.end method
