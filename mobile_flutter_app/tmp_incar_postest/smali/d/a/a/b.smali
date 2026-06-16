.class public final synthetic Ld/a/a/b;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic h:Ld/a/a/d$d;


# direct methods
.method public synthetic constructor <init>(Ld/a/a/d$d;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/a/b;->h:Ld/a/a/d$d;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-object v0, p0, Ld/a/a/b;->h:Ld/a/a/d$d;

    invoke-virtual {v0}, Ld/a/a/d$d;->a()V

    return-void
.end method
