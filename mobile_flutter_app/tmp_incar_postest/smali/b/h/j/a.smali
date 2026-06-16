.class public Lb/h/j/a;
.super Ljava/lang/Object;
.source "CallbackWithHandler.java"


# instance fields
.field public final a:Lb/h/j/f$c;

.field public final b:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Lb/h/j/f$c;Landroid/os/Handler;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/h/j/a;->a:Lb/h/j/f$c;

    .line 3
    iput-object p2, p0, Lb/h/j/a;->b:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 5

    .line 3
    iget-object v0, p0, Lb/h/j/a;->a:Lb/h/j/f$c;

    .line 4
    iget-object v1, p0, Lb/h/j/a;->b:Landroid/os/Handler;

    new-instance v2, Lb/h/j/a$b;

    invoke-direct {v2, p0, v0, p1}, Lb/h/j/a$b;-><init>(Lb/h/j/a;Lb/h/j/f$c;I)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(Landroid/graphics/Typeface;)V
    .registers 5

    .line 1
    iget-object v0, p0, Lb/h/j/a;->a:Lb/h/j/f$c;

    .line 2
    iget-object v1, p0, Lb/h/j/a;->b:Landroid/os/Handler;

    new-instance v2, Lb/h/j/a$a;

    invoke-direct {v2, p0, v0, p1}, Lb/h/j/a$a;-><init>(Lb/h/j/a;Lb/h/j/f$c;Landroid/graphics/Typeface;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public a(Lb/h/j/e$e;)V
    .registers 3

    .line 5
    invoke-virtual {p1}, Lb/h/j/e$e;->a()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 6
    iget-object p1, p1, Lb/h/j/e$e;->a:Landroid/graphics/Typeface;

    invoke-virtual {p0, p1}, Lb/h/j/a;->a(Landroid/graphics/Typeface;)V

    goto :goto_11

    .line 7
    :cond_c
    iget p1, p1, Lb/h/j/e$e;->b:I

    invoke-virtual {p0, p1}, Lb/h/j/a;->a(I)V

    :goto_11
    return-void
.end method
