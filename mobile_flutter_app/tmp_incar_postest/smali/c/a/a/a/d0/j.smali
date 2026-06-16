.class public Lc/a/a/a/d0/j;
.super Ljava/lang/Object;
.source "TextDrawableHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/d0/j$b;
    }
.end annotation


# instance fields
.field public final a:Landroid/text/TextPaint;

.field public final b:Lc/a/a/a/i0/f;

.field public c:F

.field public d:Z

.field public e:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lc/a/a/a/d0/j$b;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lc/a/a/a/i0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/d0/j$b;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Landroid/text/TextPaint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v0, p0, Lc/a/a/a/d0/j;->a:Landroid/text/TextPaint;

    .line 3
    new-instance v0, Lc/a/a/a/d0/j$a;

    invoke-direct {v0, p0}, Lc/a/a/a/d0/j$a;-><init>(Lc/a/a/a/d0/j;)V

    iput-object v0, p0, Lc/a/a/a/d0/j;->b:Lc/a/a/a/i0/f;

    .line 4
    iput-boolean v1, p0, Lc/a/a/a/d0/j;->d:Z

    .line 5
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lc/a/a/a/d0/j;->e:Ljava/lang/ref/WeakReference;

    .line 6
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/j;->a(Lc/a/a/a/d0/j$b;)V

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/d0/j;)Ljava/lang/ref/WeakReference;
    .registers 1

    .line 2
    iget-object p0, p0, Lc/a/a/a/d0/j;->e:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method public static synthetic a(Lc/a/a/a/d0/j;Z)Z
    .registers 2

    .line 1
    iput-boolean p1, p0, Lc/a/a/a/d0/j;->d:Z

    return p1
.end method


# virtual methods
.method public final a(Ljava/lang/CharSequence;)F
    .registers 5

    if-nez p1, :cond_4

    const/4 p1, 0x0

    return p1

    .line 9
    :cond_4
    iget-object v0, p0, Lc/a/a/a/d0/j;->a:Landroid/text/TextPaint;

    const/4 v1, 0x0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    move-result p1

    return p1
.end method

.method public a(Ljava/lang/String;)F
    .registers 3

    .line 5
    iget-boolean v0, p0, Lc/a/a/a/d0/j;->d:Z

    if-nez v0, :cond_7

    .line 6
    iget p1, p0, Lc/a/a/a/d0/j;->c:F

    return p1

    .line 7
    :cond_7
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/j;->a(Ljava/lang/CharSequence;)F

    move-result p1

    iput p1, p0, Lc/a/a/a/d0/j;->c:F

    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lc/a/a/a/d0/j;->d:Z

    return p1
.end method

.method public a()Lc/a/a/a/i0/d;
    .registers 2

    .line 10
    iget-object v0, p0, Lc/a/a/a/d0/j;->f:Lc/a/a/a/i0/d;

    return-object v0
.end method

.method public a(Landroid/content/Context;)V
    .registers 5

    .line 21
    iget-object v0, p0, Lc/a/a/a/d0/j;->f:Lc/a/a/a/i0/d;

    iget-object v1, p0, Lc/a/a/a/d0/j;->a:Landroid/text/TextPaint;

    iget-object v2, p0, Lc/a/a/a/d0/j;->b:Lc/a/a/a/i0/f;

    invoke-virtual {v0, p1, v1, v2}, Lc/a/a/a/i0/d;->b(Landroid/content/Context;Landroid/text/TextPaint;Lc/a/a/a/i0/f;)V

    return-void
.end method

.method public a(Lc/a/a/a/d0/j$b;)V
    .registers 3

    .line 3
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lc/a/a/a/d0/j;->e:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(Lc/a/a/a/i0/d;Landroid/content/Context;)V
    .registers 5

    .line 11
    iget-object v0, p0, Lc/a/a/a/d0/j;->f:Lc/a/a/a/i0/d;

    if-eq v0, p1, :cond_3f

    .line 12
    iput-object p1, p0, Lc/a/a/a/d0/j;->f:Lc/a/a/a/i0/d;

    if-eqz p1, :cond_2b

    .line 13
    iget-object v0, p0, Lc/a/a/a/d0/j;->a:Landroid/text/TextPaint;

    iget-object v1, p0, Lc/a/a/a/d0/j;->b:Lc/a/a/a/i0/f;

    invoke-virtual {p1, p2, v0, v1}, Lc/a/a/a/i0/d;->c(Landroid/content/Context;Landroid/text/TextPaint;Lc/a/a/a/i0/f;)V

    .line 14
    iget-object v0, p0, Lc/a/a/a/d0/j;->e:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/a/a/a/d0/j$b;

    if-eqz v0, :cond_21

    .line 15
    iget-object v1, p0, Lc/a/a/a/d0/j;->a:Landroid/text/TextPaint;

    invoke-interface {v0}, Lc/a/a/a/d0/j$b;->getState()[I

    move-result-object v0

    iput-object v0, v1, Landroid/text/TextPaint;->drawableState:[I

    .line 16
    :cond_21
    iget-object v0, p0, Lc/a/a/a/d0/j;->a:Landroid/text/TextPaint;

    iget-object v1, p0, Lc/a/a/a/d0/j;->b:Lc/a/a/a/i0/f;

    invoke-virtual {p1, p2, v0, v1}, Lc/a/a/a/i0/d;->b(Landroid/content/Context;Landroid/text/TextPaint;Lc/a/a/a/i0/f;)V

    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Lc/a/a/a/d0/j;->d:Z

    .line 18
    :cond_2b
    iget-object p1, p0, Lc/a/a/a/d0/j;->e:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lc/a/a/a/d0/j$b;

    if-eqz p1, :cond_3f

    .line 19
    invoke-interface {p1}, Lc/a/a/a/d0/j$b;->a()V

    .line 20
    invoke-interface {p1}, Lc/a/a/a/d0/j$b;->getState()[I

    move-result-object p2

    invoke-interface {p1, p2}, Lc/a/a/a/d0/j$b;->onStateChange([I)Z

    :cond_3f
    return-void
.end method

.method public a(Z)V
    .registers 2

    .line 4
    iput-boolean p1, p0, Lc/a/a/a/d0/j;->d:Z

    return-void
.end method

.method public b()Landroid/text/TextPaint;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/j;->a:Landroid/text/TextPaint;

    return-object v0
.end method
