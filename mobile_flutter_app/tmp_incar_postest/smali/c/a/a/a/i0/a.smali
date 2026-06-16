.class public final Lc/a/a/a/i0/a;
.super Lc/a/a/a/i0/f;
.source "CancelableFontCallback.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/i0/a$a;
    }
.end annotation


# instance fields
.field public final a:Landroid/graphics/Typeface;

.field public final b:Lc/a/a/a/i0/a$a;

.field public c:Z


# direct methods
.method public constructor <init>(Lc/a/a/a/i0/a$a;Landroid/graphics/Typeface;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lc/a/a/a/i0/f;-><init>()V

    .line 2
    iput-object p2, p0, Lc/a/a/a/i0/a;->a:Landroid/graphics/Typeface;

    .line 3
    iput-object p1, p0, Lc/a/a/a/i0/a;->b:Lc/a/a/a/i0/a$a;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lc/a/a/a/i0/a;->c:Z

    return-void
.end method

.method public a(I)V
    .registers 2

    .line 2
    iget-object p1, p0, Lc/a/a/a/i0/a;->a:Landroid/graphics/Typeface;

    invoke-virtual {p0, p1}, Lc/a/a/a/i0/a;->a(Landroid/graphics/Typeface;)V

    return-void
.end method

.method public final a(Landroid/graphics/Typeface;)V
    .registers 3

    .line 4
    iget-boolean v0, p0, Lc/a/a/a/i0/a;->c:Z

    if-nez v0, :cond_9

    .line 5
    iget-object v0, p0, Lc/a/a/a/i0/a;->b:Lc/a/a/a/i0/a$a;

    invoke-interface {v0, p1}, Lc/a/a/a/i0/a$a;->a(Landroid/graphics/Typeface;)V

    :cond_9
    return-void
.end method

.method public a(Landroid/graphics/Typeface;Z)V
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Lc/a/a/a/i0/a;->a(Landroid/graphics/Typeface;)V

    return-void
.end method
