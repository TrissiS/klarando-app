.class public Lc/a/a/a/d0/e;
.super Lb/b/p/j/g;
.source "NavigationMenu.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Lb/b/p/j/g;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;
    .registers 5

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lb/b/p/j/g;->a(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    check-cast p1, Lb/b/p/j/i;

    .line 2
    new-instance p2, Lc/a/a/a/d0/g;

    invoke-virtual {p0}, Lb/b/p/j/g;->e()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3, p0, p1}, Lc/a/a/a/d0/g;-><init>(Landroid/content/Context;Lc/a/a/a/d0/e;Lb/b/p/j/i;)V

    .line 3
    invoke-virtual {p1, p2}, Lb/b/p/j/i;->a(Lb/b/p/j/r;)V

    return-object p2
.end method
