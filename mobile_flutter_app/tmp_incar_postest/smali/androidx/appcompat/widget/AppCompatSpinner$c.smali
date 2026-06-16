.class public Landroidx/appcompat/widget/AppCompatSpinner$c;
.super Ljava/lang/Object;
.source "AppCompatSpinner.java"

# interfaces
.implements Landroidx/appcompat/widget/AppCompatSpinner$f;
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/AppCompatSpinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public h:Lb/b/k/a;

.field public i:Landroid/widget/ListAdapter;

.field public j:Ljava/lang/CharSequence;

.field public final synthetic k:Landroidx/appcompat/widget/AppCompatSpinner;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/AppCompatSpinner;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->k:Landroidx/appcompat/widget/AppCompatSpinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public a(I)V
    .registers 3

    const-string p1, "AppCompatSpinner"

    const-string v0, "Cannot set horizontal offset for MODE_DIALOG, ignoring"

    .line 17
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public a(II)V
    .registers 6

    .line 3
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->i:Landroid/widget/ListAdapter;

    if-nez v0, :cond_5

    return-void

    .line 4
    :cond_5
    new-instance v0, Lb/b/k/a$a;

    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->k:Landroidx/appcompat/widget/AppCompatSpinner;

    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatSpinner;->getPopupContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/b/k/a$a;-><init>(Landroid/content/Context;)V

    .line 5
    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->j:Ljava/lang/CharSequence;

    if-eqz v1, :cond_17

    .line 6
    invoke-virtual {v0, v1}, Lb/b/k/a$a;->a(Ljava/lang/CharSequence;)Lb/b/k/a$a;

    .line 7
    :cond_17
    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->i:Landroid/widget/ListAdapter;

    iget-object v2, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->k:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 8
    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v2

    .line 9
    invoke-virtual {v0, v1, v2, p0}, Lb/b/k/a$a;->a(Landroid/widget/ListAdapter;ILandroid/content/DialogInterface$OnClickListener;)Lb/b/k/a$a;

    .line 10
    invoke-virtual {v0}, Lb/b/k/a$a;->a()Lb/b/k/a;

    move-result-object v0

    iput-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->h:Lb/b/k/a;

    .line 11
    invoke-virtual {v0}, Lb/b/k/a;->g()Landroid/widget/ListView;

    move-result-object v0

    .line 12
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v1, v2, :cond_38

    .line 13
    invoke-virtual {v0, p1}, Landroid/widget/ListView;->setTextDirection(I)V

    .line 14
    invoke-virtual {v0, p2}, Landroid/widget/ListView;->setTextAlignment(I)V

    .line 15
    :cond_38
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->h:Lb/b/k/a;

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method public a(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    const-string p1, "AppCompatSpinner"

    const-string v0, "Cannot set popup background for MODE_DIALOG, ignoring"

    .line 16
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public a(Landroid/widget/ListAdapter;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->i:Landroid/widget/ListAdapter;

    return-void
.end method

.method public a(Ljava/lang/CharSequence;)V
    .registers 2

    .line 2
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->j:Ljava/lang/CharSequence;

    return-void
.end method

.method public b(I)V
    .registers 3

    const-string p1, "AppCompatSpinner"

    const-string v0, "Cannot set vertical offset for MODE_DIALOG, ignoring"

    .line 2
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public b()Z
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->h:Lb/b/k/a;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public c()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public c(I)V
    .registers 3

    const-string p1, "AppCompatSpinner"

    const-string v0, "Cannot set horizontal (original) offset for MODE_DIALOG, ignoring"

    .line 1
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public d()Landroid/graphics/drawable/Drawable;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method

.method public dismiss()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->h:Lb/b/k/a;

    if-eqz v0, :cond_a

    .line 2
    invoke-virtual {v0}, Lb/b/k/d;->dismiss()V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->h:Lb/b/k/a;

    :cond_a
    return-void
.end method

.method public e()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->j:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 1
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->k:Landroidx/appcompat/widget/AppCompatSpinner;

    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->k:Landroidx/appcompat/widget/AppCompatSpinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object p1

    if-eqz p1, :cond_19

    .line 3
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->k:Landroidx/appcompat/widget/AppCompatSpinner;

    const/4 v0, 0x0

    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$c;->i:Landroid/widget/ListAdapter;

    invoke-interface {v1, p2}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v1

    invoke-virtual {p1, v0, p2, v1, v2}, Landroid/widget/Spinner;->performItemClick(Landroid/view/View;IJ)Z

    .line 4
    :cond_19
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatSpinner$c;->dismiss()V

    return-void
.end method
