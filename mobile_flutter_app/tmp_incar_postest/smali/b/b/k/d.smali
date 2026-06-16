.class public Lb/b/k/d;
.super Landroid/app/Dialog;
.source "AppCompatDialog.java"

# interfaces
.implements Lb/b/k/b;


# instance fields
.field public h:Lb/b/k/c;

.field public final i:Lb/h/m/f$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .registers 4

    .line 1
    invoke-static {p1, p2}, Lb/b/k/d;->a(Landroid/content/Context;I)I

    move-result v0

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 2
    new-instance v0, Lb/b/k/d$a;

    invoke-direct {v0, p0}, Lb/b/k/d$a;-><init>(Lb/b/k/d;)V

    iput-object v0, p0, Lb/b/k/d;->i:Lb/h/m/f$a;

    .line 3
    invoke-virtual {p0}, Lb/b/k/d;->e()Lb/b/k/c;

    move-result-object v0

    .line 4
    invoke-static {p1, p2}, Lb/b/k/d;->a(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {v0, p1}, Lb/b/k/c;->d(I)V

    const/4 p1, 0x0

    .line 5
    invoke-virtual {v0, p1}, Lb/b/k/c;->a(Landroid/os/Bundle;)V

    return-void
.end method

.method public static a(Landroid/content/Context;I)I
    .registers 4

    if-nez p1, :cond_13

    .line 1
    new-instance p1, Landroid/util/TypedValue;

    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p0

    sget v0, Lb/b/a;->dialogTheme:I

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p1, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 3
    iget p1, p1, Landroid/util/TypedValue;->resourceId:I

    :cond_13
    return p1
.end method


# virtual methods
.method public a(Lb/b/p/b$a;)Lb/b/p/b;
    .registers 2

    const/4 p1, 0x0

    return-object p1
.end method

.method public a(Lb/b/p/b;)V
    .registers 2

    return-void
.end method

.method public a(Landroid/view/KeyEvent;)Z
    .registers 2

    .line 4
    invoke-super {p0, p1}, Landroid/app/Dialog;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 4

    .line 1
    invoke-virtual {p0}, Lb/b/k/d;->e()Lb/b/k/c;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lb/b/k/c;->a(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public b(Lb/b/p/b;)V
    .registers 2

    return-void
.end method

.method public b(I)Z
    .registers 3

    .line 1
    invoke-virtual {p0}, Lb/b/k/d;->e()Lb/b/k/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lb/b/k/c;->b(I)Z

    move-result p1

    return p1
.end method

.method public dismiss()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 2
    invoke-virtual {p0}, Lb/b/k/d;->e()Lb/b/k/c;

    move-result-object v0

    invoke-virtual {v0}, Lb/b/k/c;->f()V

    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lb/b/k/d;->i:Lb/h/m/f$a;

    invoke-static {v1, v0, p0, p1}, Lb/h/m/f;->a(Lb/h/m/f$a;Landroid/view/View;Landroid/view/Window$Callback;Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public e()Lb/b/k/c;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/k/d;->h:Lb/b/k/c;

    if-nez v0, :cond_a

    .line 2
    invoke-static {p0, p0}, Lb/b/k/c;->a(Landroid/app/Dialog;Lb/b/k/b;)Lb/b/k/c;

    move-result-object v0

    iput-object v0, p0, Lb/b/k/d;->h:Lb/b/k/c;

    .line 3
    :cond_a
    iget-object v0, p0, Lb/b/k/d;->h:Lb/b/k/c;

    return-object v0
.end method

.method public findViewById(I)Landroid/view/View;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lb/b/k/d;->e()Lb/b/k/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lb/b/k/c;->a(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public invalidateOptionsMenu()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Lb/b/k/d;->e()Lb/b/k/c;

    move-result-object v0

    invoke-virtual {v0}, Lb/b/k/c;->e()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lb/b/k/d;->e()Lb/b/k/c;

    move-result-object v0

    invoke-virtual {v0}, Lb/b/k/c;->d()V

    .line 2
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 3
    invoke-virtual {p0}, Lb/b/k/d;->e()Lb/b/k/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lb/b/k/c;->a(Landroid/os/Bundle;)V

    return-void
.end method

.method public onStop()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onStop()V

    .line 2
    invoke-virtual {p0}, Lb/b/k/d;->e()Lb/b/k/c;

    move-result-object v0

    invoke-virtual {v0}, Lb/b/k/c;->i()V

    return-void
.end method

.method public setContentView(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lb/b/k/d;->e()Lb/b/k/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lb/b/k/c;->c(I)V

    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .registers 3

    .line 2
    invoke-virtual {p0}, Lb/b/k/d;->e()Lb/b/k/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lb/b/k/c;->a(Landroid/view/View;)V

    return-void
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 4

    .line 3
    invoke-virtual {p0}, Lb/b/k/d;->e()Lb/b/k/c;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lb/b/k/c;->b(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public setTitle(I)V
    .registers 4

    .line 3
    invoke-super {p0, p1}, Landroid/app/Dialog;->setTitle(I)V

    .line 4
    invoke-virtual {p0}, Lb/b/k/d;->e()Lb/b/k/c;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lb/b/k/c;->a(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 2
    invoke-virtual {p0}, Lb/b/k/d;->e()Lb/b/k/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lb/b/k/c;->a(Ljava/lang/CharSequence;)V

    return-void
.end method
