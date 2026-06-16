.class public Lb/b/p/j/j$b;
.super Lb/b/p/j/j$a;
.source "MenuItemWrapperICS.java"

# interfaces
.implements Landroid/view/ActionProvider$VisibilityListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/p/j/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public e:Lb/h/m/b$b;


# direct methods
.method public constructor <init>(Lb/b/p/j/j;Landroid/content/Context;Landroid/view/ActionProvider;)V
    .registers 4

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lb/b/p/j/j$a;-><init>(Lb/b/p/j/j;Landroid/content/Context;Landroid/view/ActionProvider;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/MenuItem;)Landroid/view/View;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/p/j/j$a;->c:Landroid/view/ActionProvider;

    invoke-virtual {v0, p1}, Landroid/view/ActionProvider;->onCreateActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public a(Lb/h/m/b$b;)V
    .registers 3

    .line 2
    iput-object p1, p0, Lb/b/p/j/j$b;->e:Lb/h/m/b$b;

    .line 3
    iget-object v0, p0, Lb/b/p/j/j$a;->c:Landroid/view/ActionProvider;

    if-eqz p1, :cond_8

    move-object p1, p0

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    :goto_9
    invoke-virtual {v0, p1}, Landroid/view/ActionProvider;->setVisibilityListener(Landroid/view/ActionProvider$VisibilityListener;)V

    return-void
.end method

.method public b()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/j$a;->c:Landroid/view/ActionProvider;

    invoke-virtual {v0}, Landroid/view/ActionProvider;->isVisible()Z

    move-result v0

    return v0
.end method

.method public e()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/j$a;->c:Landroid/view/ActionProvider;

    invoke-virtual {v0}, Landroid/view/ActionProvider;->overridesItemVisibility()Z

    move-result v0

    return v0
.end method

.method public onActionProviderVisibilityChanged(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/p/j/j$b;->e:Lb/h/m/b$b;

    if-eqz v0, :cond_7

    .line 2
    invoke-interface {v0, p1}, Lb/h/m/b$b;->onActionProviderVisibilityChanged(Z)V

    :cond_7
    return-void
.end method
