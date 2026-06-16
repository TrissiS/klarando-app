.class public final Lb/h/k/e;
.super Ljava/lang/Object;
.source "TextDirectionHeuristicsCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/h/k/e$f;,
        Lb/h/k/e$a;,
        Lb/h/k/e$b;,
        Lb/h/k/e$c;,
        Lb/h/k/e$e;,
        Lb/h/k/e$d;
    }
.end annotation


# static fields
.field public static final a:Lb/h/k/d;

.field public static final b:Lb/h/k/d;

.field public static final c:Lb/h/k/d;

.field public static final d:Lb/h/k/d;


# direct methods
.method public static constructor <clinit>()V
    .registers 4

    .line 1
    new-instance v0, Lb/h/k/e$e;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lb/h/k/e$e;-><init>(Lb/h/k/e$c;Z)V

    sput-object v0, Lb/h/k/e;->a:Lb/h/k/d;

    .line 2
    new-instance v0, Lb/h/k/e$e;

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lb/h/k/e$e;-><init>(Lb/h/k/e$c;Z)V

    sput-object v0, Lb/h/k/e;->b:Lb/h/k/d;

    .line 3
    new-instance v0, Lb/h/k/e$e;

    sget-object v1, Lb/h/k/e$b;->a:Lb/h/k/e$b;

    invoke-direct {v0, v1, v2}, Lb/h/k/e$e;-><init>(Lb/h/k/e$c;Z)V

    sput-object v0, Lb/h/k/e;->c:Lb/h/k/d;

    .line 4
    new-instance v0, Lb/h/k/e$e;

    sget-object v1, Lb/h/k/e$b;->a:Lb/h/k/e$b;

    invoke-direct {v0, v1, v3}, Lb/h/k/e$e;-><init>(Lb/h/k/e$c;Z)V

    sput-object v0, Lb/h/k/e;->d:Lb/h/k/d;

    .line 5
    new-instance v0, Lb/h/k/e$e;

    sget-object v1, Lb/h/k/e$a;->b:Lb/h/k/e$a;

    invoke-direct {v0, v1, v2}, Lb/h/k/e$e;-><init>(Lb/h/k/e$c;Z)V

    .line 6
    sget-object v0, Lb/h/k/e$f;->b:Lb/h/k/e$f;

    return-void
.end method

.method public static a(I)I
    .registers 2

    const/4 v0, 0x1

    if-eqz p0, :cond_b

    if-eq p0, v0, :cond_9

    const/4 v0, 0x2

    if-eq p0, v0, :cond_9

    return v0

    :cond_9
    const/4 p0, 0x0

    return p0

    :cond_b
    return v0
.end method

.method public static b(I)I
    .registers 3

    const/4 v0, 0x1

    if-eqz p0, :cond_e

    if-eq p0, v0, :cond_c

    const/4 v1, 0x2

    if-eq p0, v1, :cond_c

    packed-switch p0, :pswitch_data_10

    return v1

    :cond_c
    :pswitch_c
    const/4 p0, 0x0

    return p0

    :cond_e
    :pswitch_e
    return v0

    nop

    :pswitch_data_10
    .packed-switch 0xe
        :pswitch_e
        :pswitch_e
        :pswitch_c
        :pswitch_c
    .end packed-switch
.end method
