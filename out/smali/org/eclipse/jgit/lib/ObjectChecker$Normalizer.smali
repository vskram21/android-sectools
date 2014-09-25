.class Lorg/eclipse/jgit/lib/ObjectChecker$Normalizer;
.super Ljava/lang/Object;
.source "ObjectChecker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/ObjectChecker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Normalizer"
.end annotation


# static fields
.field private static final nfc:Ljava/lang/Object;

.field private static final normalize:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    .line 586
    :try_start_0
    const-string v4, "java.text.Normalizer$Form"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 587
    .local v1, formClazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const-string v4, "NFC"

    invoke-virtual {v1, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 588
    .local v2, formNfc:Ljava/lang/Object;
    const-string v4, "java.text.Normalizer"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "normalize"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Ljava/lang/CharSequence;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    aput-object v1, v6, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_5

    move-result-object v3

    .line 609
    .end local v2           #formNfc:Ljava/lang/Object;
    .local v3, method:Ljava/lang/reflect/Method;
    :goto_0
    sput-object v3, Lorg/eclipse/jgit/lib/ObjectChecker$Normalizer;->normalize:Ljava/lang/reflect/Method;

    .line 610
    sput-object v2, Lorg/eclipse/jgit/lib/ObjectChecker$Normalizer;->nfc:Ljava/lang/Object;

    .line 611
    return-void

    .line 590
    .end local v3           #method:Ljava/lang/reflect/Method;
    :catch_0
    move-exception v0

    .line 591
    .local v0, e:Ljava/lang/ClassNotFoundException;
    const/4 v3, 0x0

    .line 592
    .restart local v3       #method:Ljava/lang/reflect/Method;
    const/4 v2, 0x0

    .line 608
    .restart local v2       #formNfc:Ljava/lang/Object;
    goto :goto_0

    .line 593
    .end local v0           #e:Ljava/lang/ClassNotFoundException;
    .end local v2           #formNfc:Ljava/lang/Object;
    .end local v3           #method:Ljava/lang/reflect/Method;
    :catch_1
    move-exception v0

    .line 594
    .local v0, e:Ljava/lang/NoSuchFieldException;
    const/4 v3, 0x0

    .line 595
    .restart local v3       #method:Ljava/lang/reflect/Method;
    const/4 v2, 0x0

    .line 608
    .restart local v2       #formNfc:Ljava/lang/Object;
    goto :goto_0

    .line 596
    .end local v0           #e:Ljava/lang/NoSuchFieldException;
    .end local v2           #formNfc:Ljava/lang/Object;
    .end local v3           #method:Ljava/lang/reflect/Method;
    :catch_2
    move-exception v0

    .line 597
    .local v0, e:Ljava/lang/NoSuchMethodException;
    const/4 v3, 0x0

    .line 598
    .restart local v3       #method:Ljava/lang/reflect/Method;
    const/4 v2, 0x0

    .line 608
    .restart local v2       #formNfc:Ljava/lang/Object;
    goto :goto_0

    .line 599
    .end local v0           #e:Ljava/lang/NoSuchMethodException;
    .end local v2           #formNfc:Ljava/lang/Object;
    .end local v3           #method:Ljava/lang/reflect/Method;
    :catch_3
    move-exception v0

    .line 600
    .local v0, e:Ljava/lang/SecurityException;
    const/4 v3, 0x0

    .line 601
    .restart local v3       #method:Ljava/lang/reflect/Method;
    const/4 v2, 0x0

    .line 608
    .restart local v2       #formNfc:Ljava/lang/Object;
    goto :goto_0

    .line 602
    .end local v0           #e:Ljava/lang/SecurityException;
    .end local v2           #formNfc:Ljava/lang/Object;
    .end local v3           #method:Ljava/lang/reflect/Method;
    :catch_4
    move-exception v0

    .line 603
    .local v0, e:Ljava/lang/IllegalArgumentException;
    const/4 v3, 0x0

    .line 604
    .restart local v3       #method:Ljava/lang/reflect/Method;
    const/4 v2, 0x0

    .line 608
    .restart local v2       #formNfc:Ljava/lang/Object;
    goto :goto_0

    .line 605
    .end local v0           #e:Ljava/lang/IllegalArgumentException;
    .end local v2           #formNfc:Ljava/lang/Object;
    .end local v3           #method:Ljava/lang/reflect/Method;
    :catch_5
    move-exception v0

    .line 606
    .local v0, e:Ljava/lang/IllegalAccessException;
    const/4 v3, 0x0

    .line 607
    .restart local v3       #method:Ljava/lang/reflect/Method;
    const/4 v2, 0x0

    .restart local v2       #formNfc:Ljava/lang/Object;
    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 578
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static normalize(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "in"

    .prologue
    .line 614
    sget-object v1, Lorg/eclipse/jgit/lib/ObjectChecker$Normalizer;->normalize:Ljava/lang/reflect/Method;

    if-nez v1, :cond_1

    .line 625
    :cond_0
    :goto_0
    return-object p0

    .line 617
    :cond_1
    :try_start_0
    sget-object v1, Lorg/eclipse/jgit/lib/ObjectChecker$Normalizer;->normalize:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    const/4 v4, 0x1

    sget-object v5, Lorg/eclipse/jgit/lib/ObjectChecker$Normalizer;->nfc:Ljava/lang/Object;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1

    move-object p0, v1

    goto :goto_0

    .line 618
    :catch_0
    move-exception v0

    .line 619
    .local v0, e:Ljava/lang/IllegalAccessException;
    goto :goto_0

    .line 620
    .end local v0           #e:Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v0

    .line 621
    .local v0, e:Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/RuntimeException;

    if-eqz v1, :cond_2

    .line 622
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    check-cast v1, Ljava/lang/RuntimeException;

    throw v1

    .line 623
    :cond_2
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Error;

    if-eqz v1, :cond_0

    .line 624
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    check-cast v1, Ljava/lang/Error;

    throw v1
.end method
