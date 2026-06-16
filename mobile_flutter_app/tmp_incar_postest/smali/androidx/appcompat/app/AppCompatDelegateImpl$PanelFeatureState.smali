.class public final Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;
.super Ljava/lang/Object;
.source "AppCompatDelegateImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/app/AppCompatDelegateImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PanelFeatureState"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState$SavedState;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Landroid/view/ViewGroup;

.field public h:Landroid/view/View;

.field public i:Landroid/view/View;

.field public j:Lb/b/p/j/g;

.field public k:Lb/b/p/j/e;

.field public l:Landroid/content/Context;

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(I)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a:I

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->q:Z

    return-void
.end method


# virtual methods
.method public a(Lb/b/p/j/m$a;)Lb/b/p/j/n;
    .registers 5

    .line 25
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    if-nez v0, :cond_6

    const/4 p1, 0x0

    return-object p1

    .line 26
    :cond_6
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->k:Lb/b/p/j/e;

    if-nez v0, :cond_1f

    .line 27
    new-instance v0, Lb/b/p/j/e;

    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->l:Landroid/content/Context;

    sget v2, Lb/b/g;->abc_list_menu_item_layout:I

    invoke-direct {v0, v1, v2}, Lb/b/p/j/e;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->k:Lb/b/p/j/e;

    .line 28
    invoke-virtual {v0, p1}, Lb/b/p/j/e;->a(Lb/b/p/j/m$a;)V

    .line 29
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->k:Lb/b/p/j/e;

    invoke-virtual {p1, v0}, Lb/b/p/j/g;->a(Lb/b/p/j/m;)V

    .line 30
    :cond_1f
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->k:Lb/b/p/j/e;

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->g:Landroid/view/ViewGroup;

    invoke-virtual {p1, v0}, Lb/b/p/j/e;->a(Landroid/view/ViewGroup;)Lb/b/p/j/n;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/content/Context;)V
    .registers 6

    .line 4
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 7
    sget v2, Lb/b/a;->actionBarPopupTheme:I

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 8
    iget v2, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz v2, :cond_21

    .line 9
    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 10
    :cond_21
    sget v2, Lb/b/a;->panelMenuListTheme:I

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 11
    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz v0, :cond_2e

    .line 12
    invoke-virtual {v1, v0, v3}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    goto :goto_33

    .line 13
    :cond_2e
    sget v0, Lb/b/i;->Theme_AppCompat_CompactMenu:I

    invoke-virtual {v1, v0, v3}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 14
    :goto_33
    new-instance v0, Lb/b/p/d;

    const/4 v2, 0x0

    invoke-direct {v0, p1, v2}, Lb/b/p/d;-><init>(Landroid/content/Context;I)V

    .line 15
    invoke-virtual {v0}, Lb/b/p/d;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 16
    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->l:Landroid/content/Context;

    .line 17
    sget-object p1, Lb/b/j;->AppCompatTheme:[I

    invoke-virtual {v0, p1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 18
    sget v0, Lb/b/j;->AppCompatTheme_panelBackground:I

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->b:I

    .line 19
    sget v0, Lb/b/j;->AppCompatTheme_android_windowAnimationStyle:I

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->f:I

    .line 20
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public a(Lb/b/p/j/g;)V
    .registers 4

    .line 21
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    if-eqz v0, :cond_c

    .line 22
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->k:Lb/b/p/j/e;

    invoke-virtual {v0, v1}, Lb/b/p/j/g;->b(Lb/b/p/j/m;)V

    .line 23
    :cond_c
    iput-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    if-eqz p1, :cond_17

    .line 24
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->k:Lb/b/p/j/e;

    if-eqz v0, :cond_17

    invoke-virtual {p1, v0}, Lb/b/p/j/g;->a(Lb/b/p/j/m;)V

    :cond_17
    return-void
.end method

.method public a()Z
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->h:Landroid/view/View;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 2
    :cond_6
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->i:Landroid/view/View;

    const/4 v2, 0x1

    if-eqz v0, :cond_c

    return v2

    .line 3
    :cond_c
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->k:Lb/b/p/j/e;

    invoke-virtual {v0}, Lb/b/p/j/e;->b()Landroid/widget/ListAdapter;

    move-result-object v0

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    if-lez v0, :cond_19

    const/4 v1, 0x1

    :cond_19
    return v1
.end method
