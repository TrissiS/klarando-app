.class public Landroidx/appcompat/widget/ActionMenuView$c;
.super Ljava/lang/Object;
.source "ActionMenuView.java"

# interfaces
.implements Lb/b/p/j/g$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/ActionMenuView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic h:Landroidx/appcompat/widget/ActionMenuView;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/ActionMenuView;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/ActionMenuView$c;->h:Landroidx/appcompat/widget/ActionMenuView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/b/p/j/g;)V
    .registers 3

    .line 3
    iget-object v0, p0, Landroidx/appcompat/widget/ActionMenuView$c;->h:Landroidx/appcompat/widget/ActionMenuView;

    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuView;->C:Lb/b/p/j/g$a;

    if-eqz v0, :cond_9

    .line 4
    invoke-interface {v0, p1}, Lb/b/p/j/g$a;->a(Lb/b/p/j/g;)V

    :cond_9
    return-void
.end method

.method public a(Lb/b/p/j/g;Landroid/view/MenuItem;)Z
    .registers 3

    .line 1
    iget-object p1, p0, Landroidx/appcompat/widget/ActionMenuView$c;->h:Landroidx/appcompat/widget/ActionMenuView;

    iget-object p1, p1, Landroidx/appcompat/widget/ActionMenuView;->H:Landroidx/appcompat/widget/ActionMenuView$d;

    if-eqz p1, :cond_e

    .line 2
    invoke-interface {p1, p2}, Landroidx/appcompat/widget/ActionMenuView$d;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p1

    if-eqz p1, :cond_e

    const/4 p1, 0x1

    goto :goto_f

    :cond_e
    const/4 p1, 0x0

    :goto_f
    return p1
.end method
