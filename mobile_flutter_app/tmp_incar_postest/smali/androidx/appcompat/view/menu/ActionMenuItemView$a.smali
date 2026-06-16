.class public Landroidx/appcompat/view/menu/ActionMenuItemView$a;
.super Lb/b/q/t;
.source "ActionMenuItemView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/view/menu/ActionMenuItemView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic q:Landroidx/appcompat/view/menu/ActionMenuItemView;


# direct methods
.method public constructor <init>(Landroidx/appcompat/view/menu/ActionMenuItemView;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/appcompat/view/menu/ActionMenuItemView$a;->q:Landroidx/appcompat/view/menu/ActionMenuItemView;

    .line 2
    invoke-direct {p0, p1}, Lb/b/q/t;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public b()Lb/b/p/j/p;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/ActionMenuItemView$a;->q:Landroidx/appcompat/view/menu/ActionMenuItemView;

    iget-object v0, v0, Landroidx/appcompat/view/menu/ActionMenuItemView;->r:Landroidx/appcompat/view/menu/ActionMenuItemView$b;

    if-eqz v0, :cond_b

    .line 2
    invoke-virtual {v0}, Landroidx/appcompat/view/menu/ActionMenuItemView$b;->a()Lb/b/p/j/p;

    move-result-object v0

    return-object v0

    :cond_b
    const/4 v0, 0x0

    return-object v0
.end method

.method public c()Z
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/ActionMenuItemView$a;->q:Landroidx/appcompat/view/menu/ActionMenuItemView;

    iget-object v1, v0, Landroidx/appcompat/view/menu/ActionMenuItemView;->p:Lb/b/p/j/g$b;

    const/4 v2, 0x0

    if-eqz v1, :cond_1c

    iget-object v0, v0, Landroidx/appcompat/view/menu/ActionMenuItemView;->m:Lb/b/p/j/i;

    invoke-interface {v1, v0}, Lb/b/p/j/g$b;->a(Lb/b/p/j/i;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 2
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/ActionMenuItemView$a;->b()Lb/b/p/j/p;

    move-result-object v0

    if-eqz v0, :cond_1c

    .line 3
    invoke-interface {v0}, Lb/b/p/j/p;->b()Z

    move-result v0

    if-eqz v0, :cond_1c

    const/4 v2, 0x1

    :cond_1c
    return v2
.end method
