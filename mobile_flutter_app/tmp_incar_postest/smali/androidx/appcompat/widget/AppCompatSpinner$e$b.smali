.class public Landroidx/appcompat/widget/AppCompatSpinner$e$b;
.super Ljava/lang/Object;
.source "AppCompatSpinner.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/widget/AppCompatSpinner$e;->a(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Landroidx/appcompat/widget/AppCompatSpinner$e;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/AppCompatSpinner$e;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$e$b;->h:Landroidx/appcompat/widget/AppCompatSpinner$e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$e$b;->h:Landroidx/appcompat/widget/AppCompatSpinner$e;

    iget-object v1, v0, Landroidx/appcompat/widget/AppCompatSpinner$e;->T:Landroidx/appcompat/widget/AppCompatSpinner;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatSpinner$e;->b(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$e$b;->h:Landroidx/appcompat/widget/AppCompatSpinner$e;

    invoke-virtual {v0}, Landroidx/appcompat/widget/ListPopupWindow;->dismiss()V

    goto :goto_1a

    .line 3
    :cond_10
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$e$b;->h:Landroidx/appcompat/widget/AppCompatSpinner$e;

    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatSpinner$e;->r()V

    .line 4
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$e$b;->h:Landroidx/appcompat/widget/AppCompatSpinner$e;

    invoke-static {v0}, Landroidx/appcompat/widget/AppCompatSpinner$e;->a(Landroidx/appcompat/widget/AppCompatSpinner$e;)V

    :goto_1a
    return-void
.end method
