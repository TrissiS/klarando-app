.class public Landroidx/appcompat/widget/AppCompatSpinner$a;
.super Lb/b/q/t;
.source "AppCompatSpinner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/widget/AppCompatSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILandroid/content/res/Resources$Theme;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic q:Landroidx/appcompat/widget/AppCompatSpinner$e;

.field public final synthetic r:Landroidx/appcompat/widget/AppCompatSpinner;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/AppCompatSpinner;Landroid/view/View;Landroidx/appcompat/widget/AppCompatSpinner$e;)V
    .registers 4

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$a;->r:Landroidx/appcompat/widget/AppCompatSpinner;

    iput-object p3, p0, Landroidx/appcompat/widget/AppCompatSpinner$a;->q:Landroidx/appcompat/widget/AppCompatSpinner$e;

    invoke-direct {p0, p2}, Lb/b/q/t;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public b()Lb/b/p/j/p;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$a;->q:Landroidx/appcompat/widget/AppCompatSpinner$e;

    return-object v0
.end method

.method public c()Z
    .registers 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SyntheticAccessor"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$a;->r:Landroidx/appcompat/widget/AppCompatSpinner;

    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatSpinner;->getInternalPopup()Landroidx/appcompat/widget/AppCompatSpinner$f;

    move-result-object v0

    invoke-interface {v0}, Landroidx/appcompat/widget/AppCompatSpinner$f;->b()Z

    move-result v0

    if-nez v0, :cond_11

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$a;->r:Landroidx/appcompat/widget/AppCompatSpinner;

    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatSpinner;->a()V

    :cond_11
    const/4 v0, 0x1

    return v0
.end method
