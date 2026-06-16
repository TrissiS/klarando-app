.class public final synthetic Ld/a/b/g/a;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/io/FileFilter;


# static fields
.field public static final synthetic a:Ld/a/b/g/a;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    new-instance v0, Ld/a/b/g/a;

    invoke-direct {v0}, Ld/a/b/g/a;-><init>()V

    sput-object v0, Ld/a/b/g/a;->a:Ld/a/b/g/a;

    return-void
.end method

.method private synthetic constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/io/File;)Z
    .registers 2

    invoke-static {p1}, Ld/a/b/g/d;->a(Ljava/io/File;)Z

    move-result p1

    return p1
.end method
