.class public Lb/h/m/y$h$a;
.super Ljava/lang/Object;
.source "ViewCompat.java"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/m/y$h;->a(Landroid/view/View;Lb/h/m/s;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Lb/h/m/g0;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lb/h/m/s;


# direct methods
.method public constructor <init>(Landroid/view/View;Lb/h/m/s;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lb/h/m/y$h$a;->b:Landroid/view/View;

    iput-object p2, p0, Lb/h/m/y$h$a;->c:Lb/h/m/s;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lb/h/m/y$h$a;->a:Lb/h/m/g0;

    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .registers 6

    .line 1
    invoke-static {p2, p1}, Lb/h/m/g0;->a(Landroid/view/WindowInsets;Landroid/view/View;)Lb/h/m/g0;

    move-result-object v0

    .line 2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-ge v1, v2, :cond_22

    .line 3
    iget-object v1, p0, Lb/h/m/y$h$a;->b:Landroid/view/View;

    invoke-static {p2, v1}, Lb/h/m/y$h;->a(Landroid/view/WindowInsets;Landroid/view/View;)V

    .line 4
    iget-object p2, p0, Lb/h/m/y$h$a;->a:Lb/h/m/g0;

    invoke-virtual {v0, p2}, Lb/h/m/g0;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_22

    .line 5
    iget-object p2, p0, Lb/h/m/y$h$a;->c:Lb/h/m/s;

    invoke-interface {p2, p1, v0}, Lb/h/m/s;->a(Landroid/view/View;Lb/h/m/g0;)Lb/h/m/g0;

    move-result-object p1

    .line 6
    invoke-virtual {p1}, Lb/h/m/g0;->k()Landroid/view/WindowInsets;

    move-result-object p1

    return-object p1

    .line 7
    :cond_22
    iput-object v0, p0, Lb/h/m/y$h$a;->a:Lb/h/m/g0;

    .line 8
    iget-object p2, p0, Lb/h/m/y$h$a;->c:Lb/h/m/s;

    invoke-interface {p2, p1, v0}, Lb/h/m/s;->a(Landroid/view/View;Lb/h/m/g0;)Lb/h/m/g0;

    move-result-object p2

    .line 9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v2, :cond_33

    .line 10
    invoke-virtual {p2}, Lb/h/m/g0;->k()Landroid/view/WindowInsets;

    move-result-object p1

    return-object p1

    .line 11
    :cond_33
    invoke-static {p1}, Lb/h/m/y;->P(Landroid/view/View;)V

    .line 12
    invoke-virtual {p2}, Lb/h/m/g0;->k()Landroid/view/WindowInsets;

    move-result-object p1

    return-object p1
.end method
