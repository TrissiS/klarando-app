.class public Landroidx/core/app/ComponentActivity;
.super Landroid/app/Activity;
.source "ComponentActivity.java"

# interfaces
.implements Lb/n/h;
.implements Lb/h/m/f$a;


# instance fields
.field public h:Lb/n/i;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 2
    new-instance v0, Lb/e/g;

    invoke-direct {v0}, Lb/e/g;-><init>()V

    .line 3
    new-instance v0, Lb/n/i;

    invoke-direct {v0, p0}, Lb/n/i;-><init>(Lb/n/h;)V

    iput-object v0, p0, Landroidx/core/app/ComponentActivity;->h:Lb/n/i;

    return-void
.end method


# virtual methods
.method public a()Lb/n/e;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/core/app/ComponentActivity;->h:Lb/n/i;

    return-object v0
.end method

.method public a(Landroid/view/KeyEvent;)Z
    .registers 2

    .line 2
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_12

    .line 2
    invoke-static {v0, p1}, Lb/h/m/f;->a(Landroid/view/View;Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_12

    const/4 p1, 0x1

    return p1

    .line 3
    :cond_12
    invoke-static {p0, v0, p0, p1}, Lb/h/m/f;->a(Lb/h/m/f$a;Landroid/view/View;Landroid/view/Window$Callback;Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_12

    .line 2
    invoke-static {v0, p1}, Lb/h/m/f;->a(Landroid/view/View;Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 p1, 0x1

    return p1

    .line 3
    :cond_12
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    invoke-static {p0}, Landroidx/lifecycle/ReportFragment;->a(Landroid/app/Activity;)V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/core/app/ComponentActivity;->h:Lb/n/i;

    sget-object v1, Lb/n/e$c;->CREATED:Lb/n/e$c;

    invoke-virtual {v0, v1}, Lb/n/i;->a(Lb/n/e$c;)V

    .line 2
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method
