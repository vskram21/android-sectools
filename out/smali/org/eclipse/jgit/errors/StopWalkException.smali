.class public Lorg/eclipse/jgit/errors/StopWalkException;
.super Ljava/lang/RuntimeException;
.source "StopWalkException.java"


# static fields
.field public static final INSTANCE:Lorg/eclipse/jgit/errors/StopWalkException; = null

.field private static final serialVersionUID:J = 0x1L


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    new-instance v0, Lorg/eclipse/jgit/errors/StopWalkException;

    invoke-direct {v0}, Lorg/eclipse/jgit/errors/StopWalkException;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/errors/StopWalkException;->INSTANCE:Lorg/eclipse/jgit/errors/StopWalkException;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 60
    return-void
.end method
