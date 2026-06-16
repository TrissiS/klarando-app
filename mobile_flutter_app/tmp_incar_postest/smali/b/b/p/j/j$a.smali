.class public Lb/b/p/j/j$a;
.super Lb/h/m/b;
.source "MenuItemWrapperICS.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/p/j/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final c:Landroid/view/ActionProvider;

.field public final synthetic d:Lb/b/p/j/j;


# direct methods
.method public constructor <init>(Lb/b/p/j/j;Landroid/content/Context;Landroid/view/ActionProvider;)V
    .registers 4

    .line 1
    iput-object p1, p0, Lb/b/p/j/j$a;->d:Lb/b/p/j/j;

    .line 2
    invoke-direct {p0, p2}, Lb/h/m/b;-><init>(Landroid/content/Context;)V

    .line 3
    iput-object p3, p0, Lb/b/p/j/j$a;->c:Landroid/view/ActionProvider;

    return-void
.end method


# virtual methods
.method public a(Landroid/view/SubMenu;)V
    .registers 4

    .line 2
    iget-object v0, p0, Lb/b/p/j/j$a;->c:Landroid/view/ActionProvider;

    iget-object v1, p0, Lb/b/p/j/j$a;->d:Lb/b/p/j/j;

    invoke-virtual {v1, p1}, Lb/b/p/j/c;->a(Landroid/view/SubMenu;)Landroid/view/SubMenu;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/ActionProvider;->onPrepareSubMenu(Landroid/view/SubMenu;)V

    return-void
.end method

.method public a()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/j$a;->c:Landroid/view/ActionProvider;

    invoke-virtual {v0}, Landroid/view/ActionProvider;->hasSubMenu()Z

    move-result v0

    return v0
.end method

.method public c()Landroid/view/View;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/j$a;->c:Landroid/view/ActionProvider;

    invoke-virtual {v0}, Landroid/view/ActionProvider;->onCreateActionView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public d()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/j$a;->c:Landroid/view/ActionProvider;

    invoke-virtual {v0}, Landroid/view/ActionProvider;->onPerformDefaultAction()Z

    move-result v0

    return v0
.end method
