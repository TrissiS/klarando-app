.class public final Lc/a/b/l/e;
.super Lc/a/b/l/l;
.source "Code39Reader.java"


# static fields
.field public static final a:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    const-string v0, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%"

    .line 1
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    const/16 v0, 0x2c

    new-array v0, v0, [I

    .line 2
    fill-array-data v0, :array_14

    sput-object v0, Lc/a/b/l/e;->a:[I

    const/16 v1, 0x27

    .line 3
    aget v0, v0, v1

    return-void

    nop

    :array_14
    .array-data 4
        0x34
        0x121
        0x61
        0x160
        0x31
        0x130
        0x70
        0x25
        0x124
        0x64
        0x109
        0x49
        0x148
        0x19
        0x118
        0x58
        0xd
        0x10c
        0x4c
        0x1c
        0x103
        0x43
        0x142
        0x13
        0x112
        0x52
        0x7
        0x106
        0x46
        0x16
        0x181
        0xc1
        0x1c0
        0x91
        0x190
        0xd0
        0x85
        0x184
        0xc4
        0x94
        0xa8
        0xa2
        0x8a
        0x2a
    .end array-data
.end method
