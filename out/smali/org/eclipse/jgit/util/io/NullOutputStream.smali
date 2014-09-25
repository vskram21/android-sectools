.class public Lorg/eclipse/jgit/util/io/NullOutputStream;
.super Ljava/io/OutputStream;
.source "NullOutputStream.java"


# static fields
.field public static final INSTANCE:Lorg/eclipse/jgit/util/io/NullOutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    new-instance v0, Lorg/eclipse/jgit/util/io/NullOutputStream;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/io/NullOutputStream;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/util/io/NullOutputStream;->INSTANCE:Lorg/eclipse/jgit/util/io/NullOutputStream;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 58
    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 0
    .parameter "b"

    .prologue
    .line 63
    return-void
.end method

.method public write([B)V
    .locals 0
    .parameter "buf"

    .prologue
    .line 68
    return-void
.end method

.method public write([BII)V
    .locals 0
    .parameter "buf"
    .parameter "pos"
    .parameter "cnt"

    .prologue
    .line 73
    return-void
.end method
