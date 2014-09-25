.class public Lorg/eclipse/jgit/errors/InvalidPatternException;
.super Ljava/lang/Exception;
.source "InvalidPatternException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final pattern:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "message"
    .parameter "pattern"

    .prologue
    .line 64
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 65
    iput-object p2, p0, Lorg/eclipse/jgit/errors/InvalidPatternException;->pattern:Ljava/lang/String;

    .line 66
    return-void
.end method


# virtual methods
.method public getPattern()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lorg/eclipse/jgit/errors/InvalidPatternException;->pattern:Ljava/lang/String;

    return-object v0
.end method
