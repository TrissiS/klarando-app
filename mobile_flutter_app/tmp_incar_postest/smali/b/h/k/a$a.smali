.class public final Lb/h/k/a$a;
.super Ljava/lang/Object;
.source "BidiFormatter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/k/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:I

.field public c:Lb/h/k/d;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Lb/h/k/a;->a(Ljava/util/Locale;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lb/h/k/a$a;->a(Z)V

    return-void
.end method

.method public static b(Z)Lb/h/k/a;
    .registers 1

    if-eqz p0, :cond_5

    .line 1
    sget-object p0, Lb/h/k/a;->h:Lb/h/k/a;

    goto :goto_7

    :cond_5
    sget-object p0, Lb/h/k/a;->g:Lb/h/k/a;

    :goto_7
    return-object p0
.end method


# virtual methods
.method public a()Lb/h/k/a;
    .registers 5

    .line 4
    iget v0, p0, Lb/h/k/a$a;->b:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_12

    iget-object v0, p0, Lb/h/k/a$a;->c:Lb/h/k/d;

    sget-object v1, Lb/h/k/a;->d:Lb/h/k/d;

    if-ne v0, v1, :cond_12

    .line 5
    iget-boolean v0, p0, Lb/h/k/a$a;->a:Z

    invoke-static {v0}, Lb/h/k/a$a;->b(Z)Lb/h/k/a;

    move-result-object v0

    return-object v0

    .line 6
    :cond_12
    new-instance v0, Lb/h/k/a;

    iget-boolean v1, p0, Lb/h/k/a$a;->a:Z

    iget v2, p0, Lb/h/k/a$a;->b:I

    iget-object v3, p0, Lb/h/k/a$a;->c:Lb/h/k/d;

    invoke-direct {v0, v1, v2, v3}, Lb/h/k/a;-><init>(ZILb/h/k/d;)V

    return-object v0
.end method

.method public final a(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lb/h/k/a$a;->a:Z

    .line 2
    sget-object p1, Lb/h/k/a;->d:Lb/h/k/d;

    iput-object p1, p0, Lb/h/k/a$a;->c:Lb/h/k/d;

    const/4 p1, 0x2

    .line 3
    iput p1, p0, Lb/h/k/a$a;->b:I

    return-void
.end method
