.class public final Landroidx/appcompat/app/AppCompatDelegateImpl$t;
.super Ljava/lang/Object;
.source "AppCompatDelegateImpl.java"

# interfaces
.implements Lb/b/p/j/m$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/app/AppCompatDelegateImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "t"
.end annotation


# instance fields
.field public final synthetic h:Landroidx/appcompat/app/AppCompatDelegateImpl;


# direct methods
.method public constructor <init>(Landroidx/appcompat/app/AppCompatDelegateImpl;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$t;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/b/p/j/g;Z)V
    .registers 7

    .line 1
    invoke-virtual {p1}, Lb/b/p/j/g;->m()Lb/b/p/j/g;

    move-result-object v0

    const/4 v1, 0x1

    if-eq v0, p1, :cond_9

    const/4 v2, 0x1

    goto :goto_a

    :cond_9
    const/4 v2, 0x0

    .line 2
    :goto_a
    iget-object v3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$t;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    if-eqz v2, :cond_f

    move-object p1, v0

    :cond_f
    invoke-virtual {v3, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroid/view/Menu;)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object p1

    if-eqz p1, :cond_29

    if-eqz v2, :cond_24

    .line 3
    iget-object p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$t;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget v2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a:I

    invoke-virtual {p2, v2, p1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(ILandroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Landroid/view/Menu;)V

    .line 4
    iget-object p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$t;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    invoke-virtual {p2, p1, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Z)V

    goto :goto_29

    .line 5
    :cond_24
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$t;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Z)V

    :cond_29
    :goto_29
    return-void
.end method

.method public a(Lb/b/p/j/g;)Z
    .registers 4

    .line 6
    invoke-virtual {p1}, Lb/b/p/j/g;->m()Lb/b/p/j/g;

    move-result-object v0

    if-ne p1, v0, :cond_1d

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$t;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-boolean v1, v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->H:Z

    if-eqz v1, :cond_1d

    .line 7
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->v()Landroid/view/Window$Callback;

    move-result-object v0

    if-eqz v0, :cond_1d

    .line 8
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$t;->h:Landroidx/appcompat/app/AppCompatDelegateImpl;

    iget-boolean v1, v1, Landroidx/appcompat/app/AppCompatDelegateImpl;->T:Z

    if-nez v1, :cond_1d

    const/16 v1, 0x6c

    .line 9
    invoke-interface {v0, v1, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    :cond_1d
    const/4 p1, 0x1

    return p1
.end method
