.class public Landroidx/recyclerview/widget/RecyclerView$w;
.super Landroidx/recyclerview/widget/RecyclerView$i;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "w"
.end annotation


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$w;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$i;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$w;->a:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->a(Ljava/lang/String;)V

    .line 2
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$w;->a:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    const/4 v2, 0x1

    iput-boolean v2, v1, Landroidx/recyclerview/widget/RecyclerView$y;->g:Z

    .line 3
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->b(Z)V

    .line 4
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$w;->a:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->k:Lb/p/d/a;

    invoke-virtual {v0}, Lb/p/d/a;->c()Z

    move-result v0

    if-nez v0, :cond_1f

    .line 5
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$w;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    :cond_1f
    return-void
.end method

.method public a(IILjava/lang/Object;)V
    .registers 6

    .line 6
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$w;->a:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->a(Ljava/lang/String;)V

    .line 7
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$w;->a:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->k:Lb/p/d/a;

    invoke-virtual {v0, p1, p2, p3}, Lb/p/d/a;->a(IILjava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_13

    .line 8
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$w;->b()V

    :cond_13
    return-void
.end method

.method public b()V
    .registers 3

    .line 1
    sget-boolean v0, Landroidx/recyclerview/widget/RecyclerView;->I0:Z

    if-eqz v0, :cond_14

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$w;->a:Landroidx/recyclerview/widget/RecyclerView;

    iget-boolean v1, v0, Landroidx/recyclerview/widget/RecyclerView;->z:Z

    if-eqz v1, :cond_14

    iget-boolean v1, v0, Landroidx/recyclerview/widget/RecyclerView;->y:Z

    if-eqz v1, :cond_14

    .line 2
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->o:Ljava/lang/Runnable;

    invoke-static {v0, v1}, Lb/h/m/y;->a(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_1c

    .line 3
    :cond_14
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$w;->a:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroidx/recyclerview/widget/RecyclerView;->H:Z

    .line 4
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    :goto_1c
    return-void
.end method
