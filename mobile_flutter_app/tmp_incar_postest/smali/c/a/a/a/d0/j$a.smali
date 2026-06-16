.class public Lc/a/a/a/d0/j$a;
.super Lc/a/a/a/i0/f;
.source "TextDrawableHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/d0/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/d0/j;


# direct methods
.method public constructor <init>(Lc/a/a/a/d0/j;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/d0/j$a;->a:Lc/a/a/a/d0/j;

    invoke-direct {p0}, Lc/a/a/a/i0/f;-><init>()V

    return-void
.end method


# virtual methods
.method public a(I)V
    .registers 3

    .line 4
    iget-object p1, p0, Lc/a/a/a/d0/j$a;->a:Lc/a/a/a/d0/j;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lc/a/a/a/d0/j;->a(Lc/a/a/a/d0/j;Z)Z

    .line 5
    iget-object p1, p0, Lc/a/a/a/d0/j$a;->a:Lc/a/a/a/d0/j;

    invoke-static {p1}, Lc/a/a/a/d0/j;->a(Lc/a/a/a/d0/j;)Ljava/lang/ref/WeakReference;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lc/a/a/a/d0/j$b;

    if-eqz p1, :cond_17

    .line 6
    invoke-interface {p1}, Lc/a/a/a/d0/j$b;->a()V

    :cond_17
    return-void
.end method

.method public a(Landroid/graphics/Typeface;Z)V
    .registers 3

    if-eqz p2, :cond_3

    return-void

    .line 1
    :cond_3
    iget-object p1, p0, Lc/a/a/a/d0/j$a;->a:Lc/a/a/a/d0/j;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lc/a/a/a/d0/j;->a(Lc/a/a/a/d0/j;Z)Z

    .line 2
    iget-object p1, p0, Lc/a/a/a/d0/j$a;->a:Lc/a/a/a/d0/j;

    invoke-static {p1}, Lc/a/a/a/d0/j;->a(Lc/a/a/a/d0/j;)Ljava/lang/ref/WeakReference;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lc/a/a/a/d0/j$b;

    if-eqz p1, :cond_1a

    .line 3
    invoke-interface {p1}, Lc/a/a/a/d0/j$b;->a()V

    :cond_1a
    return-void
.end method
